//
//  TicketService.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/15.
//

import Foundation


public let TicketService = TicketServiceSession.default

open class TicketServiceSession: AbstractService  {
    
    public static let `default` = TicketServiceSession()

    /**
     * 创建票实体
     *
     * @param ticket
     * @param privateKey
     * @return
     * @throws ServiceException
     */
    public func issueDenom(denom: Denom<TicketInfo>,
                           privateKey: String,
                           schema: Schema,
                           method: RpcMethods,
                           successCallback: @escaping (_ res: BroadcastModel) -> (),
                           errorCallback: @escaping FPErrorCallback) {
        
        NFTService.issueNft(sender: denom.create,
                            nftName: denom.name,
                            denom: denom.denom,
                            nftSchema: schema.toJSONString(),
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
    public func mintToken(tx: TxTx,
                          method: RpcMethods,
                          successCallback: @escaping (_ res: BroadcastModel) -> (),
                          errorCallback: @escaping FPErrorCallback) {
      
        RpcService.broadcast(tx: tx, method: method) { res in
            print(res)
            successCallback(res)
        } errorCallBack: { error in
            errorCallback(error)
        }
    }
    
    public func mintTokenGas(ticketEntities: [TicketInfo],
                             sender: String,
                             recipient: String,
                             privateKey: String,
                             isSign: Bool,
                             gasLimit: UInt64 = 0,
                             feeAddress: String = "",
                             fee: String = "",
                             method: RpcMethods,
                             successCallback: @escaping (_ tx: TxTx) -> (),
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
            nft.recipient = recipient
            nft.sender = sender
        
            nft.denomID = ticketEntity.denomId
            nft.name = ticketEntity.name
            nft.id = ticketEntity.tokenId
            nft.uri = ticketEntity.imgUrl
            
            if let any =  TxUtils.getProtobufAny(message: nft, typePrefix: "") {
                builder.messages.append(any)
            }
        }
        
        builder.memo = ""
        builder.timeoutHeight = 0
        //转手续费
        if feeAddress != "" && fee != "" {
            let bankMsgSend = TokenService.getBankMsgSend(from: sender,
                                                          to: feeAddress,
                                                          denom: IRISServive.defaultCoin,
                                                          amount: fee)
            if let any =  TxUtils.getProtobufAny(message: bankMsgSend, typePrefix: "") {
                builder.messages.append(any)
            }
        }
        
        TxService.signTx(txBody: builder,
                         gasLimit: gasLimit,
                         privateKey: privateKey) { tx in
             successCallback(tx)
        } errorCallBack: { error in
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
    public func getTokenInfo(denomId: String,
                              tokenId: String,
                              successCallback: @escaping (_ ticketInfo: TicketInfo) -> (),
                              errorCallback: @escaping FPErrorCallback) {
        
        NFTService.tokenInfo(denom: denomId,
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
    public func getTokens(denomId: String,
                           successCallback: @escaping (_ ticket: Denom<TicketInfo>) -> (),
                           errorCallback: @escaping FPErrorCallback) {
        
        NFTService.nftTokens(denom: denomId) { nft in
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
    public func myTokensByDenomId(owner: String,
                                  denomId: String,
                                  successCallback: @escaping (_ ticketList: [Denom<TicketInfo>]) -> (),
                                  errorCallback: @escaping FPErrorCallback) {
        
        self.getInfo(owner: owner,
                     denomId: denomId,
                     schema: .ticket) { ticketList in
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
                                    denomId: String,
                                    successCallback: @escaping (_ ticketList: [Denom<TicketInfo>]) -> (),
                                    errorCallback: @escaping FPErrorCallback) {
        self.getTickey(owner: owner,
                       denomId: denomId,
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
                                      denomId: String,
                                      successCallback: @escaping (_ ticketList: [Denom<TicketInfo>]) -> (),
                                      errorCallback: @escaping FPErrorCallback) {
        self.getTickey(owner: owner,
                       denomId: denomId,
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
                                      denomId: String,
                                      successCallback: @escaping (_ ticketList: [Denom<TicketInfo>]) -> (),
                                      errorCallback: @escaping FPErrorCallback) {
       self.getTickey(owner: owner,
                      denomId: denomId,
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
                                       denomId: String,
                                       successCallback: @escaping (_ ticketList: [Denom<TicketInfo>]) -> (),
                                       errorCallback: @escaping FPErrorCallback) {
         self.getTickey(owner: owner,
                      denomId: denomId,
                      type: 4) { ticketList in
             successCallback(ticketList)
         } errorCallback: { error in
             errorCallback(error)
         }

    
    }
    
     public func getTickey(owner: String,
                           denomId: String,
                           type: Int,
                           successCallback: @escaping (_ ticketList: [Denom<TicketInfo>]) -> (),
                           errorCallback: @escaping FPErrorCallback) {
       
        NFTService.balanceInfo(owner: owner,
                               denom: denomId) { nftTokenList in
            var denomList = [Denom<TicketInfo>]()
            for nft in nftTokenList {
                let ticket = self.formatTicket(nft, type: type)
                if ticket != nil {
                    denomList.append(ticket!)
                }
            }
            successCallback(denomList)
            
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
    public func doSign(ticketEntity: TicketInfo, privateKey:String) -> DataStandard<TicketInfo> {
        let dataStandard = DataStandard<TicketInfo>()
        dataStandard.body = ticketEntity
        dataStandard.protoc = ProtocEnum.ticket.rawValue
        dataStandard.sign(signPriKey: privateKey, pubKeyEnum: .base64)
        return dataStandard
    }
    
    public func getInfo(owner: String,
                        denomId: String,
                        schema: Schema,
                        successCallback: @escaping (_ ticketList: [Denom<TicketInfo>]) -> (),
                        errorCallback: @escaping FPErrorCallback) {
       
        NFTService.balanceInfo(owner: owner,
                               denom: denomId) { nftTokenList in
            var denomList = [Denom<TicketInfo>]()
            for nft in nftTokenList {
                let ticket = self.formatInfo(nft, schema: schema)
                if ticket != nil {
                    denomList.append(ticket!)
                }
            }
            successCallback(denomList)
            
        } errorCallback: { error in
            errorCallback(error)
        }

    }
    
    public func formatInfo(_ nft: NFT, schema: Schema) -> Denom<TicketInfo>? {
        
        var schemaType = schema.getJSONValue(nft.schema)

        if schemaType != schema.rawValue {
            return nil
        }
        
        let denom = Denom<TicketInfo>()
        denom.create = nft.creator
        denom.denom = nft.id
        denom.name = nft.name
 
        let nftTokenList = nft.tokens
        var ticketInfos = [TicketInfo]()

        for nftToken in nftTokenList {
            if let dataStandard = DataStandard<TicketInfo>.deserialize(from: nftToken.data) {
                dataStandard.verify();
                if let body = dataStandard.body {
                    ticketInfos.append(body)
                }
            }
        }
        denom.infos = ticketInfos
        return denom
    }
    
    public func formatTicket(_ nft: NFT, type: Int) -> Denom<TicketInfo>? {
        
        
        if !Schema.ticket.isEqualTo(nft.schema) {
            return nil
        }
        
        let ticket = Denom<TicketInfo>()
        ticket.create = nft.creator
        ticket.denom = nft.id
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
        
        ticket.infos = ticketInfos
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

    


}






