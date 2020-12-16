//
//  ERC20Token.swift
//  DmaIRIS_SDK_IOS
//
//  Created by StarryMedia on 2020/11/19.
//

import Foundation

public let ERC20TokenService = ERC20TokenSession.default

open class ERC20TokenSession {
        
    public static let `default` = ERC20TokenSession()

    /// 创建同质化Token
    /// - Parameters:
    ///   - initialSupply: 初始化数量
    ///   - maxSupply: 最大数量
    ///   - name: 名称
    ///   - symbol: 简称
    ///   - mintable: 是否可增发
    ///   - owner: token所有者钱包地址
    ///   - privateKey: 私钥
    public func issueToken(initialSupply: UInt64,
                           maxSupply: UInt64,
                           name: String,
                           symbol: String,
                           mintable: Bool,
                           owner: String,
                           privateKey: String,
                           successCallback: @escaping (_ res: BroadcastModel) -> (),
                           errorCallBack: @escaping FPErrorCallback) {
    
        var token = TokenMsgIssueToken()
        token.symbol = symbol
        token.initialSupply = initialSupply
        token.maxSupply = maxSupply
        token.mintable = true
        token.scale = 6
        token.name = name
        token.minUnit = symbol
        token.mintable = mintable
        
        if let ownerValue = TxUtils.fromBech32(owner) {
            token.owner = ownerValue
        }
        
        var txBody = TxUtils.getBody(meno: "", timeoutHeight: 0)
        if let any = TxUtils.getProtobufAny(message: token, typePrefix: "") {
            txBody.messages.append(any)
        }
        
        TxService.signTx(txBody: txBody, privateKey: privateKey) { tx in
            
            RpcService.broadcast(tx: tx) { res in
                print(res)
                successCallback(res)
            } errorCallBack: { error in
                errorCallBack(error)
            }
            
        }
    }
    
    /// 根据简称 增发同质化Token
    /// - Parameters:
    ///   - to: 地址
    ///   - symbol: 简称
    ///   - owner: token所有者钱包地址
    ///   - amount: 价格
    ///   - privateKey: 私钥
    public func mintToken(to: String,
                          symbol: String,
                          owner: String,
                          amount: UInt64,
                          privateKey: String,
                          successCallback: @escaping (_ res: BroadcastModel) -> (),
                          errorCallBack: @escaping FPErrorCallback) {
        
        
        var token = TokenMsgMintToken()
        token.symbol = symbol
        token.amount = amount
        if let ownerValue = TxUtils.fromBech32(owner) {
            token.owner = ownerValue
        }
        if let toValue = TxUtils.fromBech32(to) {
            token.to = toValue
        }
        
        var txBody = TxUtils.getBody(meno: "", timeoutHeight: 0)
        if let any = TxUtils.getProtobufAny(message: token, typePrefix: "") {
            txBody.messages.append(any)
        }
        
        let fee = TxUtils.getFee(gasLimit: txGasLimit, amount: txAmount, denom: txDenom)
        
        TxService.signTx(txBody: txBody, privateKey: privateKey) { tx in
            RpcService.broadcast(tx: tx) { res in
                successCallback(res)
            } errorCallBack: { error in
                errorCallBack(error)
            }
            
        }
    }
    
    //MARK:- 更换同质化Token
    public func transferTokenOwner(from: String,
                                   to: String,
                                   symbol: String,
                                   privateKey: String,
                                   successCallback: @escaping (_ res: BroadcastModel) -> (),
                                   errorCallBack: @escaping FPErrorCallback) {

        var token = TokenMsgTransferTokenOwner()
        token.symbol = symbol
        if let fromValue = TxUtils.fromBech32(from) {
            token.srcOwner = fromValue
        }
        if let toValue = TxUtils.fromBech32(to) {
            token.dstOwner = toValue
        }
        
        var txBody = TxUtils.getBody(meno: "", timeoutHeight: 0)
        if let any = TxUtils.getProtobufAny(message: token, typePrefix: "") {
            txBody.messages.append(any)
        }
        
        let fee = TxUtils.getFee(gasLimit: txGasLimit, amount: txAmount, denom: txDenom)
        
        TxService.signTx(txBody: txBody, privateKey: privateKey) { tx in
            RpcService.broadcast(tx: tx) { res in
                successCallback(res)
            } errorCallBack: { error in
                errorCallBack(error)
            }
            
        }
    }
    
    /// 根据denom(创建时的symbol)查询token信息
    /// - Parameters:
    ///   - denom: 分类ID
    ///   - callback: token信息
    /// - Returns:
    public func token(denom: String,
                      successCallback: @escaping (_ scale: UInt32) -> (),
                      errorCallBack: @escaping FPErrorCallback)  {
       
        var request = TokenQueryTokenRequest()
        request.denom = denom
        
        let client = TokenQueryClient(channel: IRISServive.channel)
        let response = client.token(request).response
        
        response.whenComplete { result in
            switch result {
            case .success(let value):
                if let token = try? TokenToken(serializedData: value.token.value) {
                    successCallback(token.scale)
                } else {
                    errorCallBack("token error")
                }
            case .failure(let error):
                errorCallBack("\(error)")
            }
        }
    }
    
    //MARK:- 根据地址查询拥有的token种类
    public func tokens(address: String,
                       successCallback: @escaping (_ tokens: [TokenToken]) -> (),
                       errorCallBack: @escaping FPErrorCallback) {
        
        var request = TokenQueryTokensRequest()

        if let addressValue = TxUtils.fromBech32(address) {
            request.owner = addressValue
        }
        let client = TokenQueryClient(channel: IRISServive.channel)
        let response = client.tokens(request).response
        response.whenComplete { result in
            switch result {
            case .success(let value):
                let dataList = value.tokens
                var tokens = [TokenToken]()
                for data in dataList {
                    if let token = try? TokenToken(serializedData: data.value) {
                        tokens.append(token)
                    }
                }
                successCallback(tokens)
            case .failure(let error):
                errorCallBack("\(error)")
            }
        }
    }
    
    //MARK:- 创建token，估算交易费
    public func fees(denom: String,
                     successCallback: @escaping (_ issueFee: BaseCoin) -> (),
                     errorCallBack: @escaping FPErrorCallback) {
        var request = TokenQueryFeesRequest()
        request.symbol = denom
        
        let response = TokenQueryClient(channel: IRISServive.channel).fees(request).response
        response.whenComplete { result in
            switch result {
            case .success(let value):
                successCallback(value.issueFee)
            case .failure(let error):
                errorCallBack("\(error)")
            }
        }
    }

    

}
