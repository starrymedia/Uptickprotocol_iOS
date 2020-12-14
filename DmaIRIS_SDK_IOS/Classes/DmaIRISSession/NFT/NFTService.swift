//
//  NFTSession.swift
//  DmaIRIS_SDK_IOS
//
//  Created by StarryMedia on 2020/11/19.
//

import Foundation

public let NFTService = NFTSession.default

open class NFTSession {
    
    public static let `default` = NFTSession()

    /// 创建分类
    /// - Parameters:
    ///   - sender: 创建人地址
    ///   - nftName: 分类名称
    ///   - nftSchema: 简介
    ///   - nftId: 唯一标识 3-64位字母/数组
    ///   - privateKey: 私钥
    ///   - successCallback: successCallback description
    ///   - errorCallback: errorCallback description
    public func issueNft(sender: String,
                         nftName: String,
                         nftSchema: String,
                         nftId: String,
                         privateKey: String,
                         successCallback: @escaping (_ res: BroadcastModel) -> (),
                         errorCallback: @escaping FPErrorCallback) {
        
        
        
        //创建Nft.MsgIssueDenom
        var msgIssueDenom = NftMsgIssueDenom()
        msgIssueDenom.name = nftName
        msgIssueDenom.schema = nftSchema
        msgIssueDenom.id = nftId
        if let senderValue = TxUtils.fromBech32(sender) {
            msgIssueDenom.sender = senderValue
        }

        //创建TxBody
        var txBody = TxUtils.getBody(meno: "", timeoutHeight: 0)
        if let any = TxUtils.getProtobufAny(message: msgIssueDenom, typePrefix: "") {
            txBody.messages.append(any)
        }
        
        //签名交易
        TxService.signTx(txBody: txBody,
                         privateKey: privateKey) { tx in
            //广播交易
            BroadcastService.broadcast(tx: tx) { res in
                print(res)
                successCallback(res)
            } errorCallBack: { error in
                errorCallback(error)
            }
        }
    }
    
   
    
    /// 批量创建NFT资产
    /// - Parameters:
    ///   - sender: 创建人地址
    ///   - recipient: 接收人地址
    ///   - name: 分类名称
    ///   - data: 简介
    ///   - nftId: 分类ID
    ///   - uri: 详细描述
    ///   - tokenIds: 同类型中多个ID不能重复 3-64位字母/数组，以字母开头
    ///   - privateKey: 私钥
    ///   - successCallback: successCallback description
    ///   - errorCallback: errorCallback description
    public func mintNFTMuch( sender: String,
                             recipient: String,
                             name: String,
                             data: String,
                             nftId: String,
                             uri: String,
                             tokenIds: [String],
                             privateKey: String,
                             successCallback: @escaping (_ res: BroadcastModel) -> (),
                             errorCallback: @escaping FPErrorCallback) {

        var txBody = TxUtils.getBody(meno: "", timeoutHeight: 0)
        for tokenId in tokenIds {
            var mintNft = NftMsgMintNFT()
            mintNft.data = data
            mintNft.denom = nftId
            mintNft.uri = uri
            mintNft.name = name
            mintNft.id = tokenId

            if let value = TxUtils.fromBech32(sender) {
                mintNft.sender = value
            }
 
            if let value = TxUtils.fromBech32(recipient) {
                mintNft.recipient = value
            }
            
            if let any =  TxUtils.getProtobufAny(message: mintNft,typePrefix: "") {
                txBody.messages.append(any)
            }
        }
        
        TxService.signTx(txBody: txBody,
                         privateKey: privateKey,
                         number: tokenIds.count) { tx in
            
            BroadcastService.broadcast(tx: tx) { res in
                print(res)
                successCallback(res)
            } errorCallBack: { error in
                errorCallback(error)
            }
        }
        
    }
    
    /// 销毁NFT资产
    /// - Parameters:
    ///   - owner: 创建人地址
    ///   - nftId: 分类ID
    ///   - tokenId: 资产ID
    ///   - privateKey: 私钥
    ///   - successCallback: successCallback description
    ///   - errorCallback: errorCallback description
    func burnNFT(owner: String,
                 nftId: String,
                 tokenId: String,
                 privateKey: String,
                 successCallback: @escaping (_ string: BroadcastModel) -> (),
                 errorCallback: @escaping FPErrorCallback) {
        
        var msgBurnNFT = NftMsgBurnNFT()
        if let value = TxUtils.fromBech32(owner) {
            msgBurnNFT.sender = value
        }
        msgBurnNFT.denom = nftId
        msgBurnNFT.id = tokenId

        
        var txBody = TxUtils.getBody(meno: "", timeoutHeight: 0)
        if let any = TxUtils.getProtobufAny(message: msgBurnNFT, typePrefix: "") {
            txBody.messages.append(any)
        }
                
        TxService.signTx(txBody: txBody, privateKey: privateKey) { tx in
            
            BroadcastService.broadcast(tx: tx) { res in
                successCallback(res)
            }errorCallBack: { error in
                errorCallback(error)
            }
        }
        
    }
    
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
                            nftId: String,
                            tokenIds: String,
                            privateKey: String,
                            successCallback: @escaping (_ res: BroadcastModel) -> (),
                            errorCallback: @escaping FPErrorCallback) {
        
        var txBody = TxUtils.getBody(meno: "", timeoutHeight: 0)
        for tokenId in tokenIds.split(separator: ",") {
            var transferNFT = NftMsgTransferNFT()
            transferNFT.data = ""
            transferNFT.denom = nftId
            transferNFT.uri = ""
            transferNFT.name = ""
            transferNFT.id = String(tokenId)

            if let value = TxUtils.fromBech32(sender) {
                transferNFT.sender = value
            }
    
            if let value = TxUtils.fromBech32(recipient) {
                transferNFT.recipient = value
            }
            
            if let any = TxUtils.getProtobufAny(message: transferNFT,typePrefix: "") {
                txBody.messages.append(any)
            }
        }
                
        TxService.signTx(txBody: txBody,
                         privateKey: privateKey) { tx in
            
            BroadcastService.broadcast(tx: tx) { res in
                successCallback(res)
            } errorCallBack: { error in
                errorCallback(error)
            }
        }
        
    }
    
    
    
    /// 根据nft id 查询nftx信息
    /// - Parameters:
    ///   - nftId: 分类ID
    ///   - successCallback: successCallback description
    ///   - errorCallback: errorCallback description
    public func queryNftById(nftId: String,
                            successCallback: @escaping (_ denom: NftDenom) -> (),
                            errorCallback: @escaping FPErrorCallback) {
        var request = NftQueryDenomRequest()
        request.denom = nftId
        
        let client = NftQueryClient(channel: IRISServive.channel)
        let response = client.denom(request).response
        response.whenComplete { result in
            switch result {
            case .success(let value):
                successCallback(value.denom)
            case .failure(let error):
                errorCallback("\(error)")
            }
        }
    }
    
    /// 查询链上所有nft信息
    /// - Parameter callback: callback description
    public func queryAllNfts(successCallback: @escaping (_ denoms: [NftDenom]) -> (),
                             errorCallback: @escaping FPErrorCallback) {
        let request = NftQueryDenomsRequest()
        let client = NftQueryClient(channel: IRISServive.channel)
        let response = client.denoms(request).response
        response.whenComplete { result in
            switch result {
            case .success(let value):
                successCallback(value.denoms)
            case .failure(let error):
                errorCallback("\(error)")
            }
        }
    }
    
    /// 根据nft id查询nft token 详情
    /// - Parameters:
    ///   - nftId: 分类ID
    ///   - successCallback: successCallback description
    ///   - errorCallback: errorCallback description
    public func queryNftInfoById(nftId: String,
                                 successCallback: @escaping (_ collection: NftCollection) -> (),
                                 errorCallback: @escaping FPErrorCallback) {
        var request = NftQueryCollectionRequest()
        request.denom = nftId
        let client = NftQueryClient(channel: IRISServive.channel)
        let response = client.collection(request).response
        response.whenComplete { result in
            switch result {
            case .success(let value):
                successCallback(value.collection)
            case .failure(let error):
                errorCallback("\(error)")
            }
        }
    }
    
    
    /// 查询资产基础信息
    /// - Parameters:
    ///   - nftId: 分类ID
    ///   - tokenId: 资产ID
    ///   - successCallback: successCallback description
    ///   - errorCallback: errorCallback description
    public func queryTokenById(nftId: String,
                               tokenId: String,
                               successCallback: @escaping (_ value: NftBaseNFT) -> (),
                               errorCallback: @escaping FPErrorCallback) {
        
        var request = NftQueryNFTRequest()
        request.denom = nftId
        request.id = tokenId
        let client = NftQueryClient(channel: IRISServive.channel)
        let response = client.nFT(request).response
        response.whenComplete { result in
            switch result {
            case .success(let value):
                successCallback(value.nft)
            case .failure(let error):
                errorCallback("\(error)")
            }
        }

    }
    
    /// 根据地址和分类查询拥有的NFT 资产
    /// - Parameters:
    ///   - owner: 钱包地址
    ///   - nftId: 分类ID
    ///   - successCallback: successCallback description
    ///   - errorCallback: errorCallback description
    public func queryBalance(owner: String,
                             nftId: String,
                             successCallback: @escaping (_ owner: NftOwner) -> (),
                             errorCallback: @escaping FPErrorCallback) {

        var request = NftQueryOwnerRequest()
        request.denom = nftId
        if let value = TxUtils.fromBech32(owner) {
            request.owner = value
        }
    
        let client = NftQueryClient(channel: IRISServive.channel)
        let response = client.owner(request).response
        response.whenComplete { result in
            switch result {
            case .success(let value):
                successCallback(value.owner)
            case .failure(let error):
                errorCallback("\(error)")
            }
        }
    }
    
    /// 根据地址和分类查询拥有资产总数
    /// - Parameters:
    ///   - owner: 钱包地址
    ///   - nftId: 分类ID
    ///   - successCallback: successCallback description
    ///   - errorCallback: errorCallback description
    public func querySupply(owner: String,
                            nftId: String,
                            successCallback: @escaping (_ amount: UInt64) -> (),
                            errorCallback: @escaping FPErrorCallback) {

        var request = NftQuerySupplyRequest()
        if let value = TxUtils.fromBech32(owner) {
            request.owner = value
        }
        request.denom = nftId
        
        let response = NftQueryClient(channel: IRISServive.channel).supply(request).response
        response.whenComplete { result in
            switch result {
            case .success(let value):
                successCallback(value.amount)
            case .failure(let error):
                errorCallback("\(error)")
            }
        }
    }
}
