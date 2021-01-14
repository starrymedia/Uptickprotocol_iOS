//
//  TicketService.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/15.
//

import Foundation


public let TicketService = TicketServiceSession.default

open class TicketServiceSession  {
    
    public static let `default` = TicketServiceSession()

    /**
     * 创建票实体
     *
     * @param ticket
     * @param privateKey
     * @return
     * @throws ServiceException
     */
    public func issueTicket( ticket: Ticket ,
                             privateKey: String,
                             method: RpcMethods,
                             successCallback: @escaping (_ res: BroadcastModel) -> (),
                             errorCallback: @escaping FPErrorCallback) {
        
        NFTService.issueNft(sender: ticket.create,
                            nftName: ticket.name,
                            nftSchema: Schema.ticket.toJSONString(),
                            denom: ticket.id,
                            privateKey: privateKey,
                            method: method) { broadcastModel in
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
    public func mintTicket( ticketEntities: [TicketInfo],
                            sender: String,
                            recipient: String,
                            privateKey: String,
                            isSign: Bool,
                            method: RpcMethods,
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
            nft.data = dataStandard.toJSONString() ?? ""
            if let value = TxUtils.fromBech32(recipient) {
                nft.recipient = value
            }
            
            if let value = TxUtils.fromBech32(sender) {
                nft.sender = value
            }
            
            nft.denom = ticketEntity.denom
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
            
            RpcService.broadcast(tx: tx, method: method) { res in
                print(res)
                successCallback(res)
            } errorCallBack: { error in
                errorCallback(error)
            }
        } errorCallBack: { error in
            errorCallback(error)
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
                           method: RpcMethods,
                           successCallback: @escaping (_ broadcastModel: BroadcastModel) -> (),
                           errorCallback: @escaping FPErrorCallback) {
        
        NFTService.burnToken(owner: owner,
                             denom: nftId,
                             tokenId: tokenId,
                             privateKey: privateKey,
                             method: method) { broadcastModel in
            successCallback(broadcastModel)
        } errorCallback: { error in
            errorCallback(error)
        }

    }
    
    /**
     * 修改nftData
     *
     * @param nftId
     * @param tokenId
     * @param owner
     * @param ownerPrivateKey
     * @param signData
     * @return
     * @throws ServiceException
     */
    public func editDate(nftId: String,
                         tokenId: String,
                         owner: String,
                         ownerPrivateKey: String,
                         signData: String,
                         method: RpcMethods,
                         successCallback: @escaping (_ broadcastModel: BroadcastModel) -> (),
                         errorCallback: @escaping FPErrorCallback) {
        
        NFTService.editToken(owner: owner,
                             denom: nftId,
                             tokenId: tokenId,
                             data: signData,
                             name: "",
                             uri: "",
                             privateKey: ownerPrivateKey,
                             method: method) { broadcastModel in
            
            successCallback(broadcastModel)
        } errorCallback: { error in
            errorCallback(error)
        }

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
    public func verifySign(nftId: String, tokenId:String,
                           base64PubKey:String,
                           successCallback: @escaping (_ verify: Bool) -> (),
                           errorCallback: @escaping FPErrorCallback) {
        
        NFTService.tokenById(denom: nftId,
                             tokenId: tokenId) { nftToken in
            
            let dataStandard = DataStandard<TicketInfo>.deserialize(from: nftToken.data)
            #warning("需要签名")
            let verify = dataStandard!.verify(verifyKey: base64PubKey)
            successCallback(verify)
        } errorCallback: { error in
            errorCallback(error)
        }
    }
    public func verifySign(nftId: String,
                           tokenId: String,
                           successCallback: @escaping (_ verify: Bool) -> (),
                           errorCallback: @escaping FPErrorCallback) {
        self.verifySign(nftId: nftId,
                   tokenId: tokenId,
                   base64PubKey: "") { verify in
            successCallback(verify)
        } errorCallback: { error in
            errorCallback(error)
        }
    }
    
    /**
     * 获取票详情
     *
     * @param nftId
     * @param tokenId
     * @return
     * @throws ServiceException
     */
    public func getTicketInfo(nftId: String,
                              tokenId: String,
                              successCallback: @escaping (_ ticketInfo: TicketInfo) -> (),
                              errorCallback: @escaping FPErrorCallback) {
        
        NFTService.tokenById(denom: nftId,
                                  tokenId: tokenId) { nftToken in
                        
            let dataStandard = DataStandard<TicketInfo>.deserialize(from: nftToken.data)
            if let ticketInfo = dataStandard?.body {
                successCallback(ticketInfo)
            } else {
                errorCallback("ticketInfo is empty")
            }
        } errorCallback: { error in
            errorCallback(error)
        }

    }
    
    /**
     * 获取所有票
     *
     * @param nftId
     * @return
     * @throws ServiceException
     */
    public func getTickets(nftId: String,
                           successCallback: @escaping (_ ticket: Ticket) -> (),
                           errorCallback: @escaping FPErrorCallback) {
        
        NFTService.nftTokens(denom: nftId) { nft in
            if let ticket = self.formatTicket(nft, type: 5) {
                successCallback(ticket)
            } else {
                errorCallback("error data")
            }
        } errorCallback: { error in
            errorCallback(error)
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
    public func getTicketsById(owner: String,
                               nftId: String,
                               successCallback: @escaping (_ ticketList: [Ticket]) -> (),
                               errorCallback: @escaping FPErrorCallback) {
        
        self.getTickey(owner: owner,
                       nftId: nftId,
                       type: 5) { ticketList in
            successCallback(ticketList)
        } errorCallback: { error in
            errorCallback(error)
        }
        
    }
    
    
    /**
     * 获取有效的票
     *
     * @param owner
     * @param nftId
     * @return
     * @throws ServiceException
     */
    public func getValidTicketsById(owner: String,
                                    nftId: String,
                                    successCallback: @escaping (_ ticketList: [Ticket]) -> (),
                                    errorCallback: @escaping FPErrorCallback) {
        
        self.getTickey(owner: owner,
                       nftId: nftId,
                       type: 1) { ticketList in
            successCallback(ticketList)
        } errorCallback: { error in
            errorCallback(error)
        }
        
    }
    
    /**
     * 获取无效的票
     *
     * @param owner
     * @param nftId
     * @return
     * @throws ServiceException
     */
    public func getInvalidTicketsById(owner: String,
                                      nftId: String,
                                      successCallback: @escaping (_ ticketList: [Ticket]) -> (),
                                      errorCallback: @escaping FPErrorCallback) {
        self.getTickey(owner: owner,
                       nftId: nftId,
                       type: 2) { ticketList in
            successCallback(ticketList)
        } errorCallback: { error in
            errorCallback(error)
        }
    }
    
    /**
     * 获取过期的票
     *
     * @param owner
     * @param nftId
     * @return
     * @throws ServiceException
     */
    public func getExpiredTicketsById(owner: String,
                                      nftId: String,
                                      successCallback: @escaping (_ ticketList: [Ticket]) -> (),
                                      errorCallback: @escaping FPErrorCallback) {
       self.getTickey(owner: owner,
                      nftId: nftId,
                      type: 3) { ticketList in
           successCallback(ticketList)
       } errorCallback: { error in
           errorCallback(error)
       }
    }
    
    
    /**
     * 获取不可用的
     *
     * @param owner
     * @param nftId
     * @return
     * @throws ServiceException
     */
    public func getTamperedTicketsById(owner: String,
                                       nftId: String,
                                       successCallback: @escaping (_ ticketList: [Ticket]) -> (),
                                       errorCallback: @escaping FPErrorCallback) {
         self.getTickey(owner: owner,
                        nftId: nftId,
                        type: 4) { ticketList in
             successCallback(ticketList)
         } errorCallback: { error in
             errorCallback(error)
         }

    
    }
    
    /**
     * 票面信息签名
     *
     * @param ticketEntity
     * @param privateKey
     * @return
     */
    public func signTicket(ticketEntity: TicketInfo, privateKey:String) -> DataStandard<TicketInfo> {
        let dataStandard = DataStandard<TicketInfo>()
        dataStandard.body = ticketEntity
        dataStandard.protoc = ProtocEnum.ticket.rawValue
        dataStandard.sign(signPriKey: privateKey, pubKeyEnum: .base64)
        return dataStandard
    }
    
    public func formatTicket(_ nft: NFT, type: Int) -> Ticket? {
        
        
        if nft.schema != Schema.ticket.rawValue {
            return nil
        }
        
        let ticket = Ticket()
        ticket.create = nft.creator
        ticket.id = nft.id
        ticket.name = nft.name
 
        let nftTokenList = nft.tokens
        var ticketInfos = [TicketInfo]()

        for nftToken in nftTokenList {
            if let dataStandard = DataStandard<TicketInfo>.deserialize(from: nftToken.data) {
                switch type {
                case 1:
                    if valid(dataStandard) {
                        if let body = dataStandard.body {
                            ticketInfos.append(body)
                        }
                    }
                case 2:
                    if inValid(dataStandard) {
                        if let body = dataStandard.body {
                            ticketInfos.append(body)
                        }
                    }
                case 3:
                    if expire(dataStandard) {
                        if let body = dataStandard.body {
                            ticketInfos.append(body)
                        }
                    }
                    
                case 4:
                    if disabled(dataStandard) {
                        if let body = dataStandard.body {
                            ticketInfos.append(body)
                        }
                    }
                default:
                    if let body = dataStandard.body {
                        ticketInfos.append(body)
                    }
                }
            }
        }
        
        ticket.ticketInfos = ticketInfos
        return ticket
    }
    
    func valid(_ dataStandard: DataStandard<TicketInfo>) -> Bool {
        
        if dataStandard.signature != nil {
            return false
        }
        
        if !dataStandard.body!.getValid() {
            return false
        }
        
        let ticketEntity = dataStandard.body
        if let time = ticketEntity?.endTime {
            if Int(Date().timeIntervalSince1970) / 1000 > time {
                return false
            }
        }
        
        return true
    }

    func inValid(_ dataStandard: DataStandard<TicketInfo>) -> Bool {
        
        if dataStandard.signature != nil {
            if !dataStandard.verify() {
                return false
            }
        }
        
        if dataStandard.body != nil {
            if !dataStandard.body!.getValid() {
                return true
            }
        }
        return false
    }
    
    
    func expire(_ dataStandard: DataStandard<TicketInfo>) -> Bool {
        
        if dataStandard.signature != nil {
            if !dataStandard.verify() {
                return false
            }
        }
        
        let ticketEntity = dataStandard.body
        if let time = ticketEntity?.endTime {
            if Int(Date().timeIntervalSince1970) / 1000 > time {
                return true
            }
        }
        return false
    }

    func disabled(_ dataStandard: DataStandard<TicketInfo>) -> Bool {
        
        if dataStandard.signature != nil {
            if !dataStandard.verify() {
                return false
            }
        }
        
        if let body = dataStandard.body {
            if !body.getValid() {
                return true
            }
            
            let ticketEntity = body
            let time = ticketEntity.endTime
            if Int(Date().timeIntervalSince1970) / 1000 > time {
                return true
            }
        }
        return false
    }

    
    func getTickey(owner: String,
                   nftId: String,
                   type: Int,
                   successCallback: @escaping (_ ticketList: [Ticket]) -> (),
                   errorCallback: @escaping FPErrorCallback) {
       
        NFTService.balanceInfo(owner: owner,
                               denom: nftId) { nftTokenList in
            var ticketList = [Ticket]()
            for nft in nftTokenList {
                let ticket = self.formatTicket(nft, type: type)
                if ticket != nil {
                    ticketList.append(ticket!)
                }
            }
            successCallback(ticketList)
            
        } errorCallback: { error in
            errorCallback(error)
        }

    }

}






