//
//  NFTSession.swift
//  DmaIRIS_SDK_IOS
//
//  Created by StarryMedia on 2020/11/19.
//

import Foundation

extension DmaIRISSession {
    
    public func issueDenom(sender: String,
                           name: String,
                           schema: String,
                           id: String,
                           chainId: String,
                           privateKey: String,
                           broadcastUrl: String,
                           successCallback: @escaping (_ string: String) -> (),
                           errorCallback: @escaping FPErrorCallback) {
        
        
        
        //创建Nft.MsgIssueDenom
        var msgIssueDenom = NftMsgIssueDenom()
        msgIssueDenom.name = name
        msgIssueDenom.schema = schema
        msgIssueDenom.id = id
        if let data = try? WalletManager.fromBech32(address: sender) {
            if let bytesValue = try? BytesValue(data) {
                msgIssueDenom.sender = bytesValue.value
            }
        }

        //创建TxBody
        var txBody = TxUtils.getBody(meno: "", timeoutHeight: 0)
        if let any = TxUtils.getProtobufAny(message: msgIssueDenom, typePrefix: "") {
            txBody.messages.append(any)
        }
        
        //设置交易费
        let fee = TxUtils.getFee(gasLimit: txGasLimit,
                              amount: txAmount,
                              denom: txDenom)

        //签名交易
        TxService.signTx(txBody: txBody,
                         fee: fee,
                         chainId: chainId,
                         privateKey: privateKey) { tx in
            print("tx:\(tx)")
            //广播交易
            TxService.broadcast(url: broadcastUrl, tx: tx) { res in
                print(res)
                successCallback(res)
            } errorCallBack: { error in
                errorCallback(error)
            }
        }
    }
    
    //MARK:- 批量创建NFT资产
    public func mintNFTMuch( sender: String,
                             recipient: String,
                             name: String,
                             data: String,
                             denom: String,
                             uri: String,
                             tokenIds: [String],
                             chainId: String,
                             broadcastUrl: String,
                             privateKey: String,
                             successCallback: @escaping (_ string: String) -> (),
                             errorCallback: @escaping FPErrorCallback) {

        var txBody = TxUtils.getBody(meno: "", timeoutHeight: 0)
        for tokenId in tokenIds {
            var mintNft = NftMsgMintNFT()
            mintNft.data = data
            mintNft.denom = denom
            mintNft.uri = uri
            mintNft.name = name
            mintNft.id = tokenId
            if let data = try? WalletManager.fromBech32(address: sender) {
                if let bytesValue = try? BytesValue(data) {
                    mintNft.sender = bytesValue.value
                }
            }
            
            if let data = try? WalletManager.fromBech32(address: recipient) {
                if let bytesValue = try? BytesValue(data) {
                    mintNft.recipient = bytesValue.value
                }
            }

            
            if let any =  TxUtils.getProtobufAny(message: mintNft,typePrefix: "") {
                txBody.messages.append(any)
            }
        }
                
        
        let limit:UInt64 = 50000 + txGasLimit*UInt64(tokenIds.count)
        let fee = TxUtils.getFee(gasLimit: limit,
                                 amount: txAmount,
                                 denom: txDenom)
        TxService.signTx(txBody: txBody,
                         fee: fee,
                         chainId: chainId,
                         privateKey: privateKey) { tx in
            
            TxService.broadcast(url: broadcastUrl, tx: tx) { res in
                print(res)
                successCallback(res)
            } errorCallBack: { error in
                errorCallback(error)
            }
        }
        
    }
    
    //MARK:- 销毁NFT资产
    func burnNFT(sender: String,
                 id: String,
                 denom: String,
                 chainId: String,
                 broadcastUrl: String,
                 privateKey: String) {
        
        var msgBurnNFT = NftMsgBurnNFT()
        msgBurnNFT.denom = denom
        msgBurnNFT.id = id
        if let data = try? WalletManager.fromBech32(address: sender) {
            if let bytesValue = try? BytesValue(data) {
                msgBurnNFT.sender = bytesValue.value
            }
        }
        
        var txBody = TxUtils.getBody(meno: "", timeoutHeight: 0)
        if let any = TxUtils.getProtobufAny(message: msgBurnNFT, typePrefix: "") {
            txBody.messages.append(any)
        }
        
        let fee = TxUtils.getFee(gasLimit: txGasLimit,
                                 amount: txAmount,
                                 denom: txDenom)
        
        TxService.signTx(txBody: txBody, fee: fee, chainId: chainId, privateKey: privateKey) { tx in
            
            TxService.broadcast(url: broadcastUrl, tx: tx) { res in
                print(res)
            }errorCallBack: { error in
                
            }
        }
        
    }
    
    //MARK:- 批量转送NFT资产
    /// 批量转送NFT资产
    /// - Parameters:
    ///   - sender: 创建人地址
    ///   - recipient: 接收人地址
    ///   - name: 分类名称
    ///   - data: 简介
    ///   - denom: 分类
    ///   - uri: 详细描述
    ///   - tokenIds: 同类型中多个ID不能重复 3-64位字母/数组，以字母开头
    ///   - chainId: 链Id
    ///   - mnemonics: 助记词
    ///   - broadcastUrl: 广播地址
    ///   - privateKey: 私钥
    public func transferNFT(sender: String,
                            recipient: String,
                            denom: String,
                            tokenIds: String,
                            chainId: String,
                            broadcastUrl: String,
                            privateKey: String,
                            successCallback: @escaping (_ string: String) -> (),
                            errorCallback: @escaping FPErrorCallback) {
        
        var txBody = TxUtils.getBody(meno: "", timeoutHeight: 0)
        for tokenId in tokenIds.split(separator: ",") {
            var transferNFT = NftMsgTransferNFT()
            transferNFT.data = ""
            transferNFT.denom = denom
            transferNFT.uri = ""
            transferNFT.name = ""
            transferNFT.id = String(tokenId)
            if let data = try? WalletManager.fromBech32(address: sender) {
                if let bytesValue = try? BytesValue(data) {
                    transferNFT.sender = bytesValue.value
                }
            }
            
            if let data = try? WalletManager.fromBech32(address: recipient) {
                if let bytesValue = try? BytesValue(data) {
                    transferNFT.recipient = bytesValue.value
                }
            }
            
            if let any = TxUtils.getProtobufAny(message: transferNFT,typePrefix: "") {
                txBody.messages.append(any)
            }
        }
                
        
        let limit:UInt64 = 50000 + txGasLimit*UInt64(tokenIds.count)
        let fee = TxUtils.getFee(gasLimit: limit,
                                 amount: "1",
                                 denom: txDenom)
        TxService.signTx(txBody: txBody,
                         fee: fee,
                         chainId: chainId,
                         privateKey: privateKey) { tx in
            
            TxService.broadcast(url: broadcastUrl, tx: tx) { res in
                print(res)
                successCallback(res)
            } errorCallBack: { error in
                errorCallback(error)
            }
        }
        
    }
    
    //MARK:- 根据分类查询 分类详细信息
    public func queryTokens(denom: String,_ callback: @escaping (_ denom: NftDenom) -> Void) {
        var request = NftQueryDenomRequest()
        request.denom = denom
        
        let client = NftQueryClient(channel: self.channel)
        let response = client.denom(request).response
        response.whenComplete { result in
            switch result {
            case .success(let value):
                callback(value.denom)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK:- 查询链上所有分类信息
    public func queryDenoms(_ callback: @escaping (_ denoms: [NftDenom]) -> Void) {
        let request = NftQueryDenomsRequest()
        let client = NftQueryClient(channel: self.channel)
        let response = client.denoms(request).response
        response.whenComplete { result in
            switch result {
            case .success(let value):
                callback(value.denoms)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK:- 根据分类查询资产
    public func queryCollection(denom: String, _ callback: @escaping (_ collection: NftCollection) -> ()) {
        var request = NftQueryCollectionRequest()
        request.denom = denom
        
        let client = NftQueryClient(channel: self.channel)
        
        let response = client.collection(request).response
        response.whenComplete { result in
            switch result {
            case .success(let value):
                callback(value.collection)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    //MARK:- 根据资产ID以及demom查询基础信息
    public func queryNFT(id: String,
                         denom: String,
                         _ callback: @escaping (_ collection: NftBaseNFT) -> ()) {
        
        var request = NftQueryNFTRequest()
        request.denom = denom
        request.id = id
        
        let client = NftQueryClient(channel: self.channel)
        let response = client.nFT(request).response
        response.whenComplete { result in
            switch result {
            case .success(let value):
                callback(value.nft)
            case .failure(let error):
                print(error)
            }
        }

    }
    
    //MARK:- 根据地址和分类查询拥有的NFT 资产
    public func queryOwner(address: String,
                           denom: String,
                           successCallback: @escaping (_ owner: NftOwner) -> (),
                           errorCallback: @escaping FPErrorCallback) {

        var request = NftQueryOwnerRequest()
        request.denom = denom
        if let data = try? WalletManager.fromBech32(address: address) {
            if let bytesValue = try? BytesValue(data) {
                request.owner = bytesValue.value
            }
        }
        let client = NftQueryClient(channel: self.channel)
        let response = client.owner(request).response
        response.whenComplete { result in
            switch result {
            case .success(let value):
                print(value)
                successCallback(value.owner)
            case .failure(let error):
                errorCallback(error.localizedDescription ?? "")
            }
        }
    }
    
    //MARK:- 根据地址和分类查询拥有资产总数
    public func querySupply(address: String,
                            denom: String,
                       _ callback: @escaping (_ amount: UInt64) -> ()) {

        var request = NftQuerySupplyRequest()
        if let data = try? WalletManager.fromBech32(address: address) {
            if let bytesValue = try? BytesValue(data) {
                request.owner = bytesValue.value
            }
        }
        request.denom = denom
        
        let response = NftQueryClient(channel: self.channel).supply(request).response
        response.whenComplete { result in
            switch result {
            case .success(let value):
                callback(value.amount)
            case .failure(let error):
                print(error)
            }
        }
    }
}
