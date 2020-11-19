//
//  ERC20Token.swift
//  DmaIRIS_SDK_IOS
//
//  Created by StarryMedia on 2020/11/19.
//

import Foundation

extension DmaIRISSession {
    
    //MARK:- 创建同质化Token
    public func issueToken(initialSupply: UInt64,
                           maxSupply: UInt64,
                           name: String,
                           symbol: String,
                           owner: String,
                           minUnit: String,
                           chainId: String,
                           mnemonics: String,
                           broadcastUrl: String,
                           privateKey: String) {
    
        var token = TokenMsgIssueToken()
        token.symbol = symbol
        token.initialSupply = initialSupply
        token.maxSupply = maxSupply
        token.mintable = true
        token.scale = 6
        token.name = name
        token.minUnit = minUnit
        token.owner = try! Bech32().decode(owner).checksum
        
        var txBody = TxUtils.getBody(meno: "", timeoutHeight: 0)
        if let any = TxUtils.getProtobufAny(message: token, typePrefix: "") {
            txBody.messages.append(any)
        }
        
        let fee = TxUtils.getFee(gasLimit: txGasLimit,
                                 amount: txAmount,
                                 denom: txDenom)
        
        TxService.signTx(txBody: txBody, fee: fee, chainId: chainId, mnemonics: mnemonics) { tx in
            
            TxService.broadcast(url: broadcastUrl, tx: tx) { res in
                print(res)
            }
            
        }
    }
    
    //MARK:- 根据简称 增发同质化Token
    public func mint(to: String,
                    symbol: String,
                    owner: String,
                    amount: UInt64,
                    chainId: String,
                    mnemonics: String,
                    broadcastUrl: String,
                    privateKey: String) {
        
        
        var token = TokenMsgMintToken()
        token.symbol = symbol
        token.amount = amount
        token.owner = try! Bech32().decode(owner).checksum
        token.to = try! Bech32().decode(to).checksum
        
        
        var txBody = TxUtils.getBody(meno: "", timeoutHeight: 0)
        if let any = TxUtils.getProtobufAny(message: token, typePrefix: "") {
            txBody.messages.append(any)
        }
        
        let fee = TxUtils.getFee(gasLimit: txGasLimit, amount: txAmount, denom: txDenom)
        
        TxService.signTx(txBody: txBody, fee: fee, chainId: chainId, mnemonics: mnemonics) { tx in
            
            TxService.broadcast(url: broadcastUrl, tx: tx) { res in
                print(res)
            }
            
        }
    }
    
    //MARK:- 更换同质化Token
    public func transferTokenOwner(from: String,
                                   to: String,
                                   symbol: String,
                                   chainId: String,
                                   mnemonics: String,
                                   broadcastUrl: String,
                                   privateKey: String) {

        
        var token = TokenMsgTransferTokenOwner()
        token.symbol = symbol
        token.srcOwner = try! Bech32().decode(from).checksum
        token.dstOwner = try! Bech32().decode(to).checksum
        
        
        var txBody = TxUtils.getBody(meno: "", timeoutHeight: 0)
        if let any = TxUtils.getProtobufAny(message: token, typePrefix: "") {
            txBody.messages.append(any)
        }
        
        let fee = TxUtils.getFee(gasLimit: txGasLimit, amount: txAmount, denom: txDenom)
        
        TxService.signTx(txBody: txBody, fee: fee, chainId: chainId, mnemonics: mnemonics) { tx in
            
            TxService.broadcast(url: broadcastUrl, tx: tx) { res in
                print(res)
            }
            
        }
    }
    
    //MARK:- 根据denom(创建时的symbol)查询token信息
    /// 根据denom(创建时的symbol)查询token信息
    /// - Parameters:
    ///   - denom: 分类ID
    ///   - callback: token信息
    /// - Returns:
    public func token(denom: String,_ callback: @escaping (_ token: Data) -> ()) {
        var request = TokenQueryTokenRequest()
        request.denom = denom
        
        let client = TokenQueryClient(channel: self.channel)
        let response = client.token(request).response
        response.whenComplete { result in
            switch result {
            case .success(let value):
                if let data = try? value.token.serializedData() {
                    callback(data)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK:- 根据地址查询拥有的token种类
    public func tokens(address: String,_ callback: @escaping (_ tokens: [Token]) -> ()) {
        var request = TokenQueryTokensRequest()
        request.owner = try! Bech32().decode(address).checksum
        
        let client = TokenQueryClient(channel: self.channel)
        let response = client.tokens(request).response
        response.whenComplete { result in
            switch result {
            case .success(let value):
                let dataList = value.tokens
                var tokens = [Token]()
                for data in dataList {
                    #warning("token有疑问")
                    if let token = try? Token(serializedData: data.value) {
                        tokens.append(token)
                    }
                }
                callback(tokens)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK:- 创建token，估算交易费
    public func fees(denom: String, _ callback: @escaping (_ issueFee: Coin) -> ()) {
        var request = TokenQueryFeesRequest()
        request.symbol = denom
        
        let response = TokenQueryClient(channel: self.channel).fees(request).response
        response.whenComplete { result in
            switch result {
            case .success(let value):
                callback(value.issueFee)
            case .failure(let error):
                print(error)
            }
        }
    }

    

}
