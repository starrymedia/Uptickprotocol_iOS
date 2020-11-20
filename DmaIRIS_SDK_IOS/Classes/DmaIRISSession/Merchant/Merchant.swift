//
//  Merchant.swift
//  DmaIRIS_SDK_IOS
//
//  Created by StarryMedia on 2020/11/19.
//

import Foundation
import HandyJSON
import Alamofire

public let MerchantSession = Merchant.default

let nodeUrl = "http://192.168.1.104:8090"

let onsaleUrl = "/api/1/merchant/onsale"//上架
let offsaleUrl = "/api/1/merchant/offsale"//下架
let transferUrl = "/api/1/merchant/transfer"//购买
let allAssetUrl = "/api/1/query/allAsset" //所有上架的
let getAssetByDenomUrl = "/api/1/query/getAssetByDenom"//根据denom查询已上架的资产
let getTokenUrl = "/api/1/query/getToken"//获取已上架NFT信息
let allAssetByAddressUrl = "/api/1/query/allAssetByAddress"//根据钱包地址查询已上架的所有资产种类
let getTokensByAddressUrl = "/api/1/query/getTokensByAddress"//根据钱包地址以及类型查询已上架的所有NFT

public class Merchant {
    
    public static let `default` = Merchant()
    init() {}

    //MARK:- 获取平台上架中的所有资产种类
    public func getAllAsset(_ callback: @escaping (_ denoms: [String]) -> ()) {
        let url = nodeUrl + allAssetUrl
        AF.request(url).responseString { response in
            switch response.result {
            case .success(let jsonString):
                if let responseModel = AllAssetModel.deserialize(from: jsonString) {
                    callback(responseModel.data ?? [])
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK:- 根据资产种类获取上架的NFT
    public func getAssetByDenom(denom: String, _ callback: @escaping (_ asset: AssetDenom) -> ()) {
        let url = nodeUrl + getAssetByDenomUrl + "?denom=\(denom)"
        
        AF.request(url).responseString { response in
            switch response.result {
            case .success(let jsonString):
                print(jsonString)
                if let responseModel = AssetModel.deserialize(from: jsonString) {
                    if let data = responseModel.data {
                        callback(data)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK:- 根据denom tokenid 获取已上架NFT信息
    public func getToken(denom: String, tokenId: String, _ callback: @escaping (_ token: TokenDataModel) -> ()) {
        let url = nodeUrl + getTokenUrl + "?denom=\(denom)&tokenId=\(tokenId)"
        AF.request(url).responseString { response in
            switch response.result {
            case .success(let jsonString):
                print(jsonString)
                if let responseModel = TokenModel.deserialize(from: jsonString) {
                    if let data = responseModel.data {
                        callback(data)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    //MARK:- 根据钱包地址查询已上架的所有资产种类
    public func getAllAssetByAddress(address: String, _ callback: @escaping (_ token: [String]) -> ()) {
        let url = nodeUrl + allAssetByAddressUrl + "?address=\(address)"
        AF.request(url).responseString { response in
            switch response.result {
            case .success(let jsonString):
                print(jsonString)
                if let responseModel = AllAssetModel.deserialize(from: jsonString) {
                    callback(responseModel.data ?? [])
                }

            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK:- 根据钱包地址以及类型查询已上架的所有NFT
    public func getTokensByAddress(address: String, denom: String, _ callback: @escaping (_ token: [TokenDataModel]) -> ()) {
        let url = nodeUrl + getTokensByAddressUrl + "?address=\(address)&denom=\(denom)"
        AF.request(url).responseString { response in
            switch response.result {
            case .success(let jsonString):
                print(jsonString)
                if let responseModel = TokensModel.deserialize(from: jsonString) {
                    if let data = responseModel.data {
                        callback(data)
                    }
                }

            case .failure(let error):
                print(error)
            }
        }
    }
    
    public func onsale(denom: String,
                       tokenids: [String],
                       price: String,
                       coin: String,
                       privateKey: String,
                       mnemonics: String) {
        
        guard let publicKeyData = try? WalletManager.exportPublicKey(mnemonics) else {
            print("publicKey error")
            return
        }
        let publicKeyString = publicKeyData?.base64EncodedString()
        let address = WalletManager.exportBech32Address(mnemonics: mnemonics)

        var param: Parameters = ["pubKey": publicKeyString ?? "",
                                 "nftDenom": denom,
                                 "owner": address]
        
        var labels = [[String: String]]()
        for tokenId in tokenids {
            let label = ["coin": coin,
                         "nftId": tokenId,
                         "price": price]
            labels.append(label)
        }
        param["labels"] = labels
        
        print(param)
        
        let url = nodeUrl + onsaleUrl
        AF.request(url, method: .post, parameters: param).responseString { response in
            switch response.result {
            case .success(let jsonString):
                print(jsonString)
                if let responseModel = TokensModel.deserialize(from: jsonString) {
                    if let data = responseModel.data {
//                        callback(data)
                        #warning("稍后再写")
                    }
                }

            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK:- 下架
    public func offsale(denom: String,
                        tokenIds: [String],
                       privateKey: String,
                       mnemonics: String) {
        
        guard let publicKeyData = try? WalletManager.exportPublicKey(mnemonics) else {
            print("publicKey error")
            return
        }
        let publicKeyString = publicKeyData?.base64EncodedString()
        let address = WalletManager.exportBech32Address(mnemonics: mnemonics)

        let param: Parameters = ["pubKey": publicKeyString ?? "",
                                 "nftDenom": denom,
                                 "owner": address,
                                 "ids": tokenIds]
        print(param)
        
        let url = nodeUrl + offsaleUrl
        AF.request(url, method: .post, parameters: param).responseString { response in
            switch response.result {
            case .success(let jsonString):
                print(jsonString)
                if let responseModel = TokensModel.deserialize(from: jsonString) {
                    if let data = responseModel.data {
//                        callback(data)
                        #warning("稍后再写")
                    }
                }

            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK:- 购买
    public func transfer(denom: String,
                        tokenIds: [String],
                       privateKey: String,
                       mnemonics: String) {
        
        guard let publicKeyData = try? WalletManager.exportPublicKey(mnemonics) else {
            print("publicKey error")
            return
        }
        let publicKeyString = publicKeyData?.base64EncodedString()
        let address = WalletManager.exportBech32Address(mnemonics: mnemonics)

        let param: Parameters = ["pubKey": publicKeyString ?? "",
                                 "nftDenom": denom,
                                 "payer": address,
                                 "recipien": address,
                                 "ids": tokenIds]
        print(param)
        
        let url = nodeUrl + transferUrl
        AF.request(url, method: .post, parameters: param).responseString { response in
            switch response.result {
            case .success(let jsonString):
                print(jsonString)
                if let responseModel = TokensModel.deserialize(from: jsonString) {
                    if let data = responseModel.data {
//                        callback(data)
                        #warning("稍后再写")
                    }
                }

            case .failure(let error):
                print(error)
            }
        }
    }
}

struct AllAssetModel: HandyJSON {
    var code: Int?
    var data: [String]?
    var msg: String?
    var success: Bool?
}

public struct AssetModel: HandyJSON {
    public init() {}
    var code: Int?
    var data: AssetDenom?
    var msg: String?
    var success: Bool?
}

public struct AssetDenom: HandyJSON {
    public init() {}
    var denom: String?
    var tokens: [AssetDenomToken]?
}

struct AssetDenomToken: HandyJSON {
    var owner: String?
    var tokenid: String?
    var assetDenom: String?
    var price: String?
    var time: String?
    var coin: String?
 }

public struct TokenModel: HandyJSON {
    public init() {}
    var code: Int?
    var data: TokenDataModel?
    var msg: String?
    var success: Bool?
}

public struct TokenDataModel: HandyJSON {
    public init() {}
    var assetDenom: String?
    var tokenid: String?
    var owner: String?
    var price: String?
    var coin: String?
    var time: String?
}

public struct TokensModel: HandyJSON {
    public init() {}
    var code: Int?
    var data: [TokenDataModel]?
    var msg: String?
    var success: Bool?
}


 
 
