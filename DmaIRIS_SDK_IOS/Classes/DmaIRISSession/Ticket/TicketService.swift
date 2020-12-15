//
//  TicketService.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/15.
//

import Foundation


class TicketService  {
    /**
     * 创建票实体
     *
     * @param ticket
     * @param privateKey
     * @return
     * @throws ServiceException
     */
    func issueTicket(ticket: Ticket ,
                     privateKey: String,
                     successCallback: @escaping (_ res: BroadcastModel) -> (),
                     errorCallback: @escaping FPErrorCallback) {
        
        NFTService.issueNft(sender: ticket.create,
                            nftName: ticket.name,
                            nftSchema: Schema.ticket.rawValue,
                            nftId: ticket.id,
                            privateKey: privateKey) { broadcastModel in
            successCallback(broadcastModel)
        } errorCallback: { error in
            errorCallback(error)
        }

    }
    
    /**
     * 发行票
     *
     * @param ticketEntities
     * @param sender
     * @param recipient
     * @param privateKey
     * @param isSign
     * @return
     * @throws ServiceException
     */
    func mintTicket(ticketEntities: [TicketInfo],
                    sender: String,
                    recipient: String,
                    privateKey: String,
                    isSign: Bool,
                    successCallback: @escaping (_ res: BroadcastModel) -> (),
                    errorCallback: @escaping FPErrorCallback) {
        
        var builder = TxBody()
        
        for ticketEntity in ticketEntities {
            
            var dataStandard = DataStandard<TicketInfo>()
            
            if ticketEntity.isValid == nil {
                ticketEntity.isValid = true
            }
            
            dataStandard.body = ticketEntity
            dataStandard.protoc = ProtocEnum.ticket.rawValue
            if (isSign) {
                dataStandard.sign(signPriKey: privateKey, pubKeyEnum: .base64)
            }
            
            var nft = NftMsgMintNFT()
            nft.data = "JSONObject.toJSONString(\(dataStandard))"
            if let value = TxUtils.fromBech32(recipient) {
                nft.recipient = value
            }
            
            if let value = TxUtils.fromBech32(sender) {
                nft.sender = value
            }
            
            nft.denom = ticketEntity.nftId
            nft.name = ticketEntity.name
            nft.id = ticketEntity.nftTokeId
            nft.uri = ticketEntity.imgUrl
            
            if let any =  TxUtils.getProtobufAny(message: nft, typePrefix: "") {
                builder.messages.append(any)
            }
        }
        
        builder.memo = ""
        builder.timeoutHeight = 0
        
        
        TxService.signTx(txBody: builder,
                         privateKey: privateKey) { tx in
            
            BroadcastService.broadcast(tx: tx) { res in
                print(res)
                successCallback(res)
            } errorCallBack: { error in
                errorCallback(error)
            }
        }
    }
    
    /**
     * 销毁票
     *
     * @param owner
     * @param nftId
     * @param tokenId
     * @param privateKey
     * @return
     * @throws ServiceException
     */
    public func burnTicket(owner: String,
                           nftId: String,
                           tokenId: String,
                           privateKey: String,
                           successCallback: @escaping (_ broadcastModel: BroadcastModel) -> (),
                           errorCallback: @escaping FPErrorCallback) {
        
        NFTService.burnToken(owner: owner,
                             nftId: nftId,
                             tokenId: tokenId,
                             privateKey: privateKey) { broadcastModel in
            successCallback(broadcastModel)
        } errorCallback: { error in
            errorCallback(error)
        }

    }
    
    /**
     * 票核销
     *
     * @param nftId
     * @param tokenId
     * @param owner
     * @param ownerPrivateKey
     * @param signData
     * @return
     * @throws ServiceException
     */
    public func wiped(nftId: String,
                      tokenId: String,
                      owner: String,
                      ownerPrivateKey: String,
                      signData: String,
                      successCallback: @escaping (_ broadcastModel: BroadcastModel) -> (),
                      errorCallback: @escaping FPErrorCallback) {
        
        #warning("一会加上")
    }
    
    /**
     * 验证票
     *
     * @param nftId
     * @param tokenId
     * @param base64PubKey
     * @return
     * @throws ServiceException
     */
    public func verifySign(nftId: String, tokenId:String, base64PubKey:String) -> Bool {
        
//        NFTToken nftToken = nftService.tokenById(nftId, tokenId);
        #warning("一会加上")

        NFTService.tokenById(nftId: nftId,
                             tokenId: tokenId) { nftToken in
            
//            DataStandard<TicketInfo> dataStandard = JSONObject.parseObject(nftToken.getData(), new TypeReference<DataStandard<TicketInfo>>() {
//            });
//            return dataStandard.verify(base64PubKey);

        } errorCallback: { error in
            
        }

        
        return false
    }
    
    /**
     * 获取票详情
     *
     * @param nftId
     * @param tokenId
     * @return
     * @throws ServiceException
     */
//    TicketInfo ticketInfo(String nftId, String tokenId) throws ServiceException;
 
    public func ticketInfo(nftId: String, tokenId: String) {
        
        #warning("一会加上")
        NFTService.tokenById(nftId: nftId,
                                  tokenId: tokenId) { nftToken in
            
//            DataStandard<TicketInfo> dataStandard = JSONObject.parseObject(nftToken.getData(), new TypeReference<DataStandard<TicketInfo>>() {
//            });
//            return dataStandard.verify(base64PubKey);

        } errorCallback: { error in
            
        }

    }
    
    /**
     * 获取所有票
     *
     * @param nftId
     * @return
     * @throws ServiceException
     */
//    Ticket ticket(String nftId) throws ServiceException;
    func ticket(nftId: String)  {
        
//        NFT nft = nftService.nftInfoById(nftId);

        NFTService.nftInfoById(nftId: nftId) { nft in
            #warning("一会加上")
        } errorCallback: { error in
            
        }

    }
    
    /**
     * 根据账号获取所有票
     *
     * @param owner
     * @param nftId
     * @return
     * @throws ServiceException
     */
    func balanceAll(owner: String, nftId: String) {
        
    }
    
    
    /**
     * 获取有效的票
     *
     * @param owner
     * @param nftId
     * @return
     * @throws ServiceException
     */
    func balanceByValid(owner: String, nftId: String) {
        
    }
    
    /**
     * 获取无效的票
     *
     * @param owner
     * @param nftId
     * @return
     * @throws ServiceException
     */
    func balanceByInvalid(owner: String, nftId: String) {

    }
    
    /**
     * 获取过期的票
     *
     * @param owner
     * @param nftId
     * @return
     * @throws ServiceException
     */
    func balanceByExpire(owner: String, nftId: String) {

    
    }
    
    
    /**
     * 获取不可用的
     *
     * @param owner
     * @param nftId
     * @return
     * @throws ServiceException
     */
    func balanceByDisabled(owner: String, nftId: String) {

    
    }
    
    /**
     * 票面信息签名
     *
     * @param ticketEntity
     * @param privateKey
     * @return
     */
    func signTicket(ticketEntity: TicketInfo, privateKey:String) {
        
    }



    
    public func formatTicket(nft: NftCollection, type: Int) {
        
//        if (!nft.getSchema().equals(Schema.ticket.getType())) {
//            return null;
//        }
        
        

    }





}






