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
            RpcService.broadcast(tx: tx) { res in
                print(res)
                successCallback(res)
            } errorCallBack: { error in
                errorCallback(error)
            }
        }
    }
    
   
    
    /// 创建NFT资产
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
    public func mintToken(sender: String,
                          recipient: String,
                          nftId: String,
                          tokenIds: [String],
                          name: String,
                          data: String,
                          uri: String,
                          privateKey: String,
                          successCallback: @escaping (_ res: BroadcastModel) -> (),
                          errorCallback: @escaping FPErrorCallback) {

        if (tokenIds == nil || tokenIds.count == 0) {
            print("Tokenid is empty");
        }
        
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
                         privateKey: privateKey) { tx in
            
            RpcService.broadcast(tx: tx) { res in
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
    func burnToken(owner: String,
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
            
            RpcService.broadcast(tx: tx) { res in
                successCallback(res)
            }errorCallBack: { error in
                errorCallback(error)
            }
        }
        
    }
    
    /**
      * 修改资产
      *
      * @param owner
      * @param nftId
      * @param tokenId
      * @param data
      * @param name
      * @param uri
      * @param privateKey
      */
    public func editToken(owner: String,
                          nftId: String,
                          tokenId: String,
                          data: String = "[do-not-modify]",
                          name: String = "[do-not-modify]",
                          uri: String = "[do-not-modify]",
                          privateKey: String,
                          successCallback: @escaping (_ res: BroadcastModel) -> (),
                          errorCallback: @escaping FPErrorCallback) {

        var nft = NftMsgEditNFT()
        nft.data = data
        nft.name = name
        nft.uri = uri
        if let value = TxUtils.fromBech32(owner) {
            nft.sender = value
        }
        nft.denom = nftId
        nft.id = tokenId

        if !uri.isEmpty {
            nft.name = uri
        }
        
        if !name.isEmpty {
            nft.uri = name
        }
        
        if !data.isEmpty {
            nft.data = data
        }
        
        var txBody = TxUtils.getBody(meno: "", timeoutHeight: 0)
        if let any = TxUtils.getProtobufAny(message: nft, typePrefix: "") {
            txBody.messages.append(any)
        }

        
        TxService.signTx(txBody: txBody,
                         privateKey: privateKey) { tx in
            
            RpcService.broadcast(tx: tx) { res in
                successCallback(res)
            } errorCallBack: { error in
                errorCallback(error)
            }
        }
        
    }
    
    ///转送NFT
    public func transferToken(sender: String,
                              recipient: String,
                              nftId: String,
                              tokenIds: [String],
                              privateKey: String,
                              successCallback: @escaping (_ res: BroadcastModel) -> (),
                              errorCallback: @escaping FPErrorCallback) {
        self.transferToken(sender: sender,
                           recipient:
                            recipient,
                           nftId: nftId,
                           tokenIds: tokenIds,
                           memo: "",
                           privateKey: privateKey,
                           successCallback: successCallback,
                           errorCallback: errorCallback)
    }

    /// 批量转送NFT
    /// - Parameters:
    ///   - sender: 创建人地址
    ///   - recipient: 接收人地址
    ///   - name: 分类名称
    ///   - data: 简介
    ///   - denom: 分类
    ///   - uri: 详细描述
    ///   - tokenIds: 同类型中多个ID不能重复 3-64位字母/数组，以字母开头
    ///   - privateKey: 私钥
    public func transferToken(sender: String,
                              recipient: String,
                              nftId: String,
                              tokenIds: [String],
                              memo: String,
                              privateKey: String,
                              successCallback: @escaping (_ res: BroadcastModel) -> (),
                              errorCallback: @escaping FPErrorCallback) {
        
        var txBody = TxUtils.getBody(meno: memo, timeoutHeight: 0)
        for tokenId in tokenIds {
            var transferNFT = NftMsgTransferNFT()
            transferNFT.denom = nftId
            transferNFT.uri = "[do-not-modify]"
            transferNFT.name = "[do-not-modify]"
            transferNFT.data = "[do-not-modify]"
            transferNFT.id = tokenId

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
            
            RpcService.broadcast(tx: tx) { res in
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
    public func nftById(nftId: String,
                        successCallback: @escaping (_ nft: NFT) -> (),
                        errorCallback: @escaping FPErrorCallback) {
        
        var request = NftQueryDenomRequest()
        request.denom = nftId
        
        let client = NftQueryClient(channel: IRISServive.channel)
        let response = client.denom(request).response
        response.whenComplete { result in
            switch result {
            case .success(let value):
                let nft = self.formatNft(value.denom)
                successCallback(nft)
            case .failure(let error):
                errorCallback("\(error)")
            }
        }
    }
    
    /// 查询链上所有nft信息
    /// - Parameter callback: callback description
    public func allNfts(successCallback: @escaping (_ denoms: [NFT]) -> (),
                        errorCallback: @escaping FPErrorCallback) {
        let request = NftQueryDenomsRequest()
        let client = NftQueryClient(channel: IRISServive.channel)
        let response = client.denoms(request).response
        response.whenComplete { result in
            switch result {
            case .success(let value):
                let list = self.formatNftList(value.denoms)
                successCallback(list)
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
    public func nftInfoById(nftId: String,
                            successCallback: @escaping (_ nft: NFT) -> (),
                            errorCallback: @escaping FPErrorCallback) {
        var request = NftQueryCollectionRequest()
        request.denom = nftId
        let client = NftQueryClient(channel: IRISServive.channel)
        let response = client.collection(request).response
        response.whenComplete { result in
            switch result {
            case .success(let value):
                print(value)
                let denom = value.collection.denom
                let nft = self.formatNft(denom)
                
                let nftList = value.collection.nfts
                let tokenList = self.formatNftTokenList(nftList)
                nft.tokens = tokenList
                
                successCallback(nft)
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
    public func tokenById(nftId: String,
                          tokenId: String,
                          successCallback: @escaping (_ value: NFTToken) -> (),
                          errorCallback: @escaping FPErrorCallback) {
        
        var request = NftQueryNFTRequest()
        request.denom = nftId
        request.id = tokenId
        let client = NftQueryClient(channel: IRISServive.channel)
        let response = client.nFT(request).response
        response.whenComplete { result in
            switch result {
            case .success(let value):
                successCallback(self.formatNftToken(value.nft))
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
    public func balance(owner: String,
                        nftId: String,
                        successCallback: @escaping (_ list: [NFT]) -> (),
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
                successCallback(self.formatNfts(value.owner.idCollections))
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
    public func balanceInfo(owner: String,
                            nftId: String,
                            successCallback: @escaping (_ nftList: [NFT]) -> (),
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
                self.formatNftInfo(value.owner.idCollections) { nftList in
                    successCallback(nftList)
                } errorCallback: { error in
                    errorCallback(error)
                }
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
    public func supply(owner: String,
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
    
    func formatNft(_ denom: NftDenom) -> NFT {
        let nft = NFT()
        print(denom.creator)
        print(denom.id)
        print(denom.name)

        nft.creator = Bech32Utils.toBech32(hrp: AddressUtils.HRP, pubkeyHexData: denom.creator)
        nft.id = denom.id
        nft.name = denom.name
        nft.schema = denom.schema
        return nft
    }

    func formatNftList(_ denoms: [NftDenom]) -> [NFT] {
        var list = [NFT]()
        for demo in denoms {
            list.append(formatNft(demo))
        }
        
        return list
    }
 
    func formatNftToken(_ baseNFT: NftBaseNFT) -> NFTToken {
        let token = NFTToken()
        token.owner = Bech32Utils.toBech32(hrp: AddressUtils.HRP, pubkeyHexData: baseNFT.owner)
        token.id = baseNFT.id
        token.name = baseNFT.name
        token.data = baseNFT.data
        token.uri = baseNFT.uri
        return token
    }
    
    func formatNftTokenList(_ baseNFTs: [NftBaseNFT]) -> [NFTToken] {
        var list = [NFTToken]()
        for item in baseNFTs {
            list.append(formatNftToken(item))
        }
        return list
    }

    func formatNftInfo(_ idCollectionList:[NftIDCollection],
                       successCallback: @escaping (_ nftList: [NFT]) -> (),
                       errorCallback: @escaping FPErrorCallback) {
        var nftList = [NFT]()
        for idCollection in idCollectionList {
            let denom = idCollection.denom
            self.nftById(nftId: denom) { nft in
                let tokenids = idCollection.ids
                let nftTokens = nft.tokens
                var nftTokenList = [NFTToken]()
                for nftToken in nftTokens {
                    if (tokenids.contains(nftToken.id)) {
                        nftTokenList.append(nftToken)
                    }
                }
                nft.tokens = nftTokenList
                nftList.append(nft)
                successCallback(nftList)
            } errorCallback: { error in
                errorCallback(error)
            }

        }
    }

    func formatNfts(_ idCollectionList:[NftIDCollection]) -> [NFT] {
        var nftList = [NFT]()
        for idCollection in idCollectionList {
            let denom = idCollection.denom
            
            let nft = NFT()
            nft.id = denom
            
            let tokenids = idCollection.ids
            var list = [NFTToken]()
            for tokenid in tokenids {
                let nftToken = NFTToken()
                nftToken.id = tokenid
                list.append(nftToken)
            }
            nft.tokens = list
            nftList.append(nft)
        }
        return nftList
    }
}
