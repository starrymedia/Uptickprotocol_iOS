//
//  Merchant.swift
//  DmaIRIS_SDK_IOS
//
//  Created by StarryMedia on 2020/11/19.
//

import Foundation

let onsaleUrl = "/api/1/merchant/onsale"//上架
let offsaleUrl = "/api/1/merchant/offsale"//下架
let transferUrl = "/api/1/merchant/transfer"//购买
let allAssetUrl = "/api/1/query/allAsset" //所有上架的
let getAssetByDenomUrl = "/api/1/query/getAssetByDenom"//根据denom查询已上架的资产
let getTokenUrl = "/api/1/query/getToken"//获取已上架NFT信息
let allAssetByAddressUrl = "/api/1/query/allAssetByAddress"//根据钱包地址查询已上架的所有资产种类
let getTokensByAddressUrl = "/api/1/query/getTokensByAddress"//根据钱包地址以及类型查询已上架的所有NFT

public let MerchantService = Merchant.default

public class Merchant {
    
    public static let `default` = Merchant()
    open var nodeUrl = ""

    init() {}

    //MARK:- 获取平台上架中的所有资产种类
    public func getAllAsset(successCallback: @escaping (_ denoms: [String]? ) -> (),
                            errorCallback: @escaping FPErrorCallback) {
        let url = nodeUrl + allAssetUrl
        IRISAF.getRequest(url: url) { jsonString in
            if let responseModel = AllAssetModel.deserialize(from: jsonString) {
                successCallback(responseModel.data ?? [])
            } else {
                errorCallback("getAllAsset error")
            }
        } errorCallBack: { error in
            errorCallback(error)
        }

    }
    
    //MARK:- 根据资产种类获取上架的NFT
    public func getAssetByDenom(denom: String,
                                successCallback: @escaping (_ asset: AssetDenom ) -> (),
                                errorCallback: @escaping FPErrorCallback) {
        let url = nodeUrl + getAssetByDenomUrl + "?denom=\(denom)"
        IRISAF.getRequest(url: url) { jsonString in
            if let responseModel = AssetModel.deserialize(from: jsonString) {
                if let data = responseModel.data {
                    successCallback(data)
                }
            } else {
                errorCallback("getAssetByDenom error")
            }
        } errorCallBack: { error in
            errorCallback(error)
        }
    }
    
    //MARK:- 根据denom tokenid 获取已上架NFT信息
    public func getToken(denom: String, tokenId: String,
                         successCallback: @escaping (_ token: TokenDataModel ) -> (),
                         errorCallback: @escaping FPErrorCallback) {
        let url = nodeUrl + getTokenUrl + "?denom=\(denom)&tokenId=\(tokenId)"
        
        IRISAF.getRequest(url: url) { jsonString in
            if let responseModel = TokenModel.deserialize(from: jsonString) {
                if let data = responseModel.data {
                    successCallback(data)
                }
            } else {
                errorCallback("getToken error")
            }
        } errorCallBack: { error in
            errorCallback(error)
        }
    }
    
    
    //MARK:- 根据钱包地址查询已上架的所有资产种类
    public func getAllAssetByAddress(address: String,
                                     successCallback: @escaping (_ token: [String] ) -> (),
                                     errorCallback: @escaping FPErrorCallback) {
        
        let url = nodeUrl + allAssetByAddressUrl + "?address=\(address)"
        
        IRISAF.getRequest(url: url) { jsonString in
            if let responseModel = AllAssetModel.deserialize(from: jsonString) {
                if responseModel.success {
                    successCallback(responseModel.data ?? [])
                } else {
                    errorCallback(responseModel.msg ?? "getToken error")
                }
            } else {
                errorCallback("getToken error")
            }
        } errorCallBack: { error in
            errorCallback(error)
        }
    }
    
    //MARK:- 根据钱包地址以及类型查询已上架的所有NFT
    public func getTokensByAddress(address: String,
                                   denom: String,
                                   successCallback: @escaping (_ token: [TokenDataModel]? ) -> (),
                                   errorCallback: @escaping FPErrorCallback) {
        
        let url = nodeUrl + getTokensByAddressUrl + "?address=\(address)&denom=\(denom)"
        
        IRISAF.getRequest(url: url) { jsonString in
            if let responseModel = TokensModel.deserialize(from: jsonString) {
                if responseModel.success {
                    successCallback(responseModel.data)
                } else {
                    errorCallback(responseModel.msg ?? "getTokensByAddress error")
                }
            } else {
                errorCallback("getToken error")
            }
        } errorCallBack: { error in
            errorCallback(error)
        }
    }
    
    public func onsale(denom: String,
                       tokenids: [String],
                       price: String,
                       coin: String,
                       privateKey: String,
                       successCallback: @escaping (_ value: String) -> (),
                       errorCallback: @escaping FPErrorCallback) {
        

        TxUtils.toWei(tokenSymblol: coin, amount: Double(price) ?? 0.00) { amount in
            
            self.onsaleRequset(denom: denom,
                               tokenids: tokenids,
                               price: amount,
                               coin: coin,
                               privateKey: privateKey) { value in
                successCallback(value)
            } errorCallback: { error in
                errorCallback(error)
            }

        } errorCallBack: { error in
            
            errorCallback(error)

        }

   
    }
    
    func onsaleRequset(denom: String,
                       tokenids: [String],
                       price: String,
                       coin: String,
                       privateKey: String,
                       successCallback: @escaping (_ value: String) -> (),
                       errorCallback: @escaping FPErrorCallback) {
        
        guard let publicKeyData = try? WalletManager.exportPublicKey(privateKey: privateKey) else {
            print("publicKey error")
            return
        }
        let publicKeyString = publicKeyData.base64EncodedString() ?? ""
        let address = WalletManager.exportBech32Address(privateKey: privateKey)
        var params = MerchantOnSale(pubKey: publicKeyString,
                                    nftId: denom,
                                    owner: address)
        
        var labels = [MerchantOnSaleLabels]()
        for tokenId in tokenids {
            let label = MerchantOnSaleLabels(coin: coin,
                                             tokenId: tokenId,
                                             price: price)
            labels.append(label)
        }
        params.labels = labels
        print(params)

        let url = nodeUrl + onsaleUrl

        self.onSaleRequest(url: url, parameters: params, privateKey: privateKey) { jsonString in
            successCallback(jsonString)
        } errorCallback: { error in
            errorCallback(error)
        }
    }
    
    func onSaleRequest(url: String,
                       parameters: MerchantOnSale,
                       privateKey: String,
                       successCallback: @escaping (_ jsonString: String) -> (),
                       errorCallback: @escaping FPErrorCallback) {
        
        var params = parameters
        IRISAF.postRequest(url: url, parameters: params) { jsonString in
            if let responseModel = MerchantResponseModel.deserialize(from: jsonString) {
                if responseModel.success == true {
                    if let data = responseModel.data {
                        if let hashData = Data(base64Encoded: data)?.sha256() {
                            params.signatures = WalletManager.signatureString(hashData: hashData, privateKey: privateKey)?.base64EncodedString()
                            
                            IRISAF.postRequest(url: url, parameters: params) { jsonString in
                                if let responseModel = MerchantResponseModel.deserialize(from: jsonString) {
                                    if responseModel.success == true {
                                        successCallback(jsonString)
                                    } else {
                                        errorCallback(responseModel.msg ?? "")
                                    }
                                }
                            } errorCallBack: { error in
                                errorCallback(error)
                            }
                        }
                    }
                } else {
                    errorCallback(responseModel.msg ?? "")
                }
            } else {
                errorCallback("\(onsaleUrl) error")
            }
        } errorCallBack: { error in
            errorCallback(error)
        }
    }
    
    //MARK:- 下架
    public func offsale(denom: String,
                        tokenIds: [String],
                        privateKey: String,
                        successCallback: @escaping () -> (),
                        errorCallback: @escaping FPErrorCallback) {
        
        guard let publicKeyData = try? WalletManager.exportPublicKey(privateKey: privateKey) else {
            print("publicKey error")
            return
        }
        let publicKeyString = publicKeyData.base64EncodedString() ?? ""
        let address = WalletManager.exportBech32Address(privateKey: privateKey)

        let param = MerchantOffSale(pubKey: publicKeyString,
                                    nftId: denom,
                                    owner: address,
                                    tokenIds: tokenIds)
        
        let url = nodeUrl + offsaleUrl
        IRISAF.postRequest(url: url, parameters: param) { jsonString in
            if let responseModel = TokensModel.deserialize(from: jsonString) {
                if responseModel.success {
                    successCallback()
                } else {
                    errorCallback(responseModel.msg ?? "")
                }
            }
        } errorCallBack: { error in
            errorCallback("\(error)")
        }
    }
    
    //MARK:- 购买
    public func transfer(denom: String,
                        tokenIds: [String],
                        privateKey: String,
                        successCallback: @escaping (_ value: String) -> (),
                        errorCallback: @escaping FPErrorCallback) {
        
        guard let publicKeyData = try? WalletManager.exportPublicKey(privateKey: privateKey) else {
            print("publicKey error")
            return
        }
        let publicKeyString = publicKeyData.base64EncodedString()
        let address = WalletManager.exportBech32Address(privateKey: privateKey)

        var param = MerchantTransfer(payerPubKey: publicKeyString,
                                     nftTd: denom,
                                     payer: address,
                                     recipien: address,
                                     ids: tokenIds)
        
        let url = nodeUrl + transferUrl

        self.transferRequest(url: url, parameters: param, privateKey: privateKey) { jsonString in
            successCallback(jsonString)
        } errorCallback: { error in
            errorCallback(error)
        }

    }
    
    func transferRequest(url: String,
                         parameters: MerchantTransfer,
                         privateKey: String,
                         successCallback: @escaping (_ jsonString: String) -> (),
                         errorCallback: @escaping FPErrorCallback) {
        
        var param = parameters
        IRISAF.postRequest(url: url, parameters: param) { jsonString in
            
            if let responseModel = MerchantResponseModel.deserialize(from: jsonString) {
                if responseModel.success == true {
                    
                    if let data = responseModel.data {
                        
                        if let hashData = Data(base64Encoded: data)?.sha256() {
                            param.signatures = WalletManager.signatureString(hashData: hashData, privateKey: privateKey)?.base64EncodedString()
                      
                            IRISAF.postRequest(url: url, parameters: param) { jsonString in
                                if let responseModel = MerchantResponseModel.deserialize(from: jsonString) {
                                    
                                    if responseModel.success == true {
                                        successCallback(jsonString)
                                    } else {
                                        errorCallback(responseModel.msg ?? "")
                                    }
                                }
                            } errorCallBack: { error in
                                errorCallback(error)
                            }

                        }
                        
                    } else {
                        errorCallback("\(transferUrl) error")
                    }
                    
                } else {
                    errorCallback(responseModel.msg ?? "")
                }
            }


        } errorCallBack: { error in
            errorCallback(error)
        }

    }

}

