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
                       callback: String,
                       successCallback: @escaping (_ value: String) -> (),
                       errorCallback: @escaping FPErrorCallback) {
        

        TokenService.toWei(tokenSymblol: coin,
                           amount: Decimal(Double(price) ?? 0.00)) { amount in
            
            self.onsaleRequset(denom: denom,
                               tokenids: tokenids,
                               price: amount,
                               coin: coin,
                               privateKey: privateKey,
                               callback: callback) { value in
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
                       callback: String,
                       successCallback: @escaping (_ value: String) -> (),
                       errorCallback: @escaping FPErrorCallback) {
        
        guard let publicKeyData = try? WalletManager.exportPublicKey(privateKey: privateKey) else {
            print("publicKey error")
            return
        }
        let publicKeyString = publicKeyData.base64EncodedString() ?? ""
        let address = WalletManager.exportBech32Address(privateKey: privateKey)
        var params = MerchantOnSale(callback: callback,
//                                    pubKey: publicKeyString,
                                    denom: denom,
                                    owner: address)
        
        var labels = [MerchantOnSaleLabels]()
        for tokenId in tokenids {
            let label = MerchantOnSaleLabels(tokenId: tokenId,
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
        
        self.getOnSaleTxBody(url: url,
                             parameters: parameters,
                             privateKey: privateKey,
                             successCallback: successCallback,
                             errorCallback: errorCallback)
    }
    
    
    //http请求merchant 获取 TxBody
    func getOnSaleTxBody(url: String,
                         parameters: MerchantOnSale,
                         privateKey: String,
                         successCallback: @escaping (_ jsonString: String) -> (),
                         errorCallback: @escaping FPErrorCallback)
    {

        IRISAF.postRequest(url: url, parameters: parameters) { jsonString in
            
            guard let responseModel = MerchantResponseModel.deserialize(from: jsonString) else {
                errorCallback("onsale data error")
                return
            }
            
            if responseModel.success == false {
                errorCallback(responseModel.msg ?? "")
                return
            }
            
            guard let dataBase64String = responseModel.data  else {
                errorCallback("onsale data error")
                return
            }
           
            
            guard let base64Data = Data(base64Encoded: dataBase64String, options: Data.Base64DecodingOptions(rawValue:0)) else {
                errorCallback("onsale base64Data error")
                return
            }
            guard let body = try? TxBody(serializedData: base64Data) else {
                errorCallback("onsale serializedTxbody error")
                return
            }
            self.getOnSaleSignatures(url: url,
                                     txBody: body,
                                     parameters: parameters,
                                     privateKey: privateKey,
                                     successCallback: successCallback,
                                     errorCallback: errorCallback)
        } errorCallBack: { error in
            errorCallback(error)
        }
    }
    //获取签名
    func getOnSaleSignatures(url: String,
                             txBody: TxBody,
                             parameters: MerchantOnSale,
                             privateKey: String,
                             successCallback: @escaping (_ jsonString: String) -> (),
                             errorCallback: @escaping FPErrorCallback) {
        
        TxService.signTx(txBody: txBody, privateKey: privateKey) { tx in
            guard  let txString = try? tx.serializedData().base64EncodedString() else {
                errorCallback("onsale signTx error")
                return
            }
            
            var params = parameters
            params.signatures = txString
            self.requestOnSaleWithSignatures(url: url,
                                             parameters: params,
                                             privateKey: privateKey,
                                             successCallback: successCallback,
                                             errorCallback: errorCallback)
        } errorCallBack: { error in
            errorCallback(error)
        }
        
    }
     
    //再次请求merchant,获取结果
    func requestOnSaleWithSignatures(url: String,
                                 parameters: MerchantOnSale,
                                 privateKey: String,
                                 successCallback: @escaping (_ jsonString: String) -> (),
                                 errorCallback: @escaping FPErrorCallback) {
        IRISAF.postRequest(url: url, parameters: parameters) { jsonString in
            if let responseModel = MerchantResponseModel.deserialize(from: jsonString) {
                if responseModel.success == true {
                    successCallback(responseModel.data as? String ?? "")
                } else {
                    errorCallback(responseModel.msg ?? "")
                }
            }
        } errorCallBack: { error in
            errorCallback(error)
        }
    }
    
    //MARK:- 下架
    public func offsale(denom: String,
                        tokenIds: [String],
                        privateKey: String,
                        callback: String,
                        successCallback: @escaping () -> (),
                        errorCallback: @escaping FPErrorCallback) {
        
        guard let publicKeyData = try? WalletManager.exportPublicKey(privateKey: privateKey) else {
            print("publicKey error")
            return
        }
        let publicKeyString = publicKeyData.base64EncodedString() ?? ""
        let address = WalletManager.exportBech32Address(privateKey: privateKey)

        let param = MerchantOffSale(callback: callback,
                                    pubKey: publicKeyString,
                                    denom: denom,
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
                        memo: String,
                        callback: String,
                        successCallback: @escaping (_ data: String) -> (),
                        errorCallback: @escaping FPErrorCallback) {
        
        guard let publicKeyData = try? WalletManager.exportPublicKey(privateKey: privateKey) else {
            print("publicKey error")
            return
        }
        let publicKeyString = publicKeyData.base64EncodedString()
        let address = WalletManager.exportBech32Address(privateKey: privateKey)

        var param = MerchantTransfer(callBack: callback,
                                     payerPubKey: publicKeyString,
                                     denom: denom,
                                     payer: address,
                                     recipien: address,
                                     ids: tokenIds,
                                     memo: memo)
        
        let url = nodeUrl + transferUrl

        self.transferRequest(url: url, parameters: param, privateKey: privateKey, successCallback: successCallback, errorCallback: errorCallback)

    }
    
    func transferRequest(url: String,
                         parameters: MerchantTransfer,
                         privateKey: String,
                         successCallback: @escaping (_ data: String) -> (),
                         errorCallback: @escaping FPErrorCallback) {
        
        var param = parameters
        IRISAF.postRequest(url: url, parameters: param) { jsonString in
            
            if let responseModel = MerchantResponseModel.deserialize(from: jsonString) {
                if responseModel.success == true {
                    
                    if let data = responseModel.data as? String {
                        
                        if let hashData = Data(base64Encoded: data)?.sha256() {
                            param.signatures = WalletManager.signatureString(hashData: hashData, privateKey: privateKey)?.base64EncodedString()
                      
                            IRISAF.postRequest(url: url, parameters: param) { jsonString in
                                print(jsonString)
                                if let responseModel = MerchantResponseModel.deserialize(from: jsonString) {
                                    
                                    if responseModel.success == true {
                                        successCallback(responseModel.data as? String ?? "")
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

