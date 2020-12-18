//
//  QueryService.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/16.
//

import Foundation
import HandyJSON

public let QueryService = QueryServiceSession.default


public class QueryServiceSession {
    public static let `default` = QueryServiceSession()

    /**
     * 查询所有交易记录
     * @param sender
     * @param actionType
     * @param page
     * @param size
     * @return
     * @throws ServiceException
    */
    public func searchTxs(page: Int,
                          size: Int,
                          orderBy: String  = "desc",
                          conditions: [Condition],
                          successCallback: @escaping (_ result: SearchTxsResult) -> (),
                          errorCallBack: @escaping FPErrorCallback) {
        
        let eventQueryBuilder = EventQueryBuilder()
        conditions.forEach { condition in
            eventQueryBuilder.addCondition(condition: condition)
        }
        
        let query = eventQueryBuilder.build()
        
        var parameters = SearchTxsParameters()
        parameters.query = query
        parameters.order_by = orderBy
        parameters.page = "\(page)"
        parameters.per_page = "\(size)"
        
        RpcService.request(method: .txSearch,
                           params: parameters) { jsonString in
            
            if let searchTxsResult = SearchTxsResult.deserialize(from: jsonString, designatedPath: "result") {
                
                searchTxsResult.txs.forEach { queryTxResult in
                    self.parseTxResult(queryTxResult: queryTxResult)
                }
                successCallback(searchTxsResult)
            } else {
                errorCallBack("searchTxs data error")
            }
        } errorCallBack: { error in
            errorCallBack(error)
        }
    }
    
    /**
        * 根据块号查询
        *
        * @param height
        * @return
        * @throws ServiceException
        */
    public func queryBlock(height: String,
                           successCallback: @escaping (_ result: BlockResult) -> (),
                           errorCallBack: @escaping FPErrorCallback) {
        
        let params = QueryBlockParamterd(height: height)
        RpcService.request(method: .block,
                           params: params) { jsonString in
            
            if let blockResult = BlockResult.deserialize(from: jsonString, designatedPath: "result") {
                successCallback(blockResult)
            } else {
                errorCallBack("queryBlock data error")
            }
        } errorCallBack: { error in
            errorCallBack(error)
        }

        
    }

    
    /**
     * 根据hash查询交易记录详情
     * @param hash
     * @return
     * @throws ServiceException
     */
    public func queryTxByHash(hash: String,
                              successCallback: @escaping (_ result: QueryTxResult) -> (),
                              errorCallBack: @escaping FPErrorCallback) {
        
        let hashString = Data.fromHex(hash)?.base64EncodedString()
        
        let parameters = QueryTxByHashParamterd(hash: hashString)
        
        RpcService.request(method: .tx,
                           params: parameters) { jsonString in
            
            if let queryTxResult = QueryTxResult.deserialize(from: jsonString, designatedPath: "result") {
                self.parseTxResult(queryTxResult: queryTxResult)
                successCallback(queryTxResult)
            } else {
                errorCallBack("queryTxByHash data error")
            }
        } errorCallBack: { error in
            errorCallBack(error)
        }
        
    }
    
    /**
     * 查询 sender 签名的交易记录
     *
     * @param sender
     * @param page
     * @param size
     * @param orderBy
     * @param blockTime
     * @return
     */
    public func searchTxsBySender(sender: String,
                                  page: Int,
                                  size: Int,
                                  orderBy: String,
                                  successCallback: @escaping (_ result: SearchTxsResult) -> (),
                                  errorCallBack: @escaping FPErrorCallback) {
        let condition = Condition(key: EventKey.MessageSender.rawValue)
        condition.eq(sender)
        var conditions = [Condition]()
        conditions.append(condition)
        self.searchTxs(page: page, size: size, orderBy: orderBy, conditions: conditions, successCallback: successCallback, errorCallBack: errorCallBack)
    }
    
    /**
     * 查询 sender 签名的token交易记录
     *
     * @param sender
     * @param page
     * @param size
     * @param orderBy
     * @param blockTime
     * @return
     */
    public func searchTokenTxsBySender(sender: String,
                                       page: Int,
                                       size: Int,
                                       orderBy: String,
                                       successCallback: @escaping (_ result: SearchTxsResult) -> (),
                                       errorCallBack: @escaping FPErrorCallback) {
        let condition = Condition(key: EventKey.MessageSender.rawValue)
        condition.eq(sender)
        let condition2 = Condition(key: EventKey.MessageModule.rawValue)
        condition2.eq(ModuleType.Token.rawValue)

        var conditions = [Condition]()
        conditions.append(condition)
        conditions.append(condition2)

        self.searchTxs(page: page, size: size, orderBy: orderBy, conditions: conditions, successCallback: successCallback, errorCallBack: errorCallBack)


    }
    
    /**
     * 查询 Token 发送者为sender 的交易记录
     *
     * @param sender
     * @param page
     * @param size
     * @param orderBy
     * @param blockTime
     * @return
     */
    public func searchTokenTxsByTransferSender(sender: String,
                                               page: Int,
                                               size: Int,
                                               orderBy: String,
                                               successCallback: @escaping (_ result: SearchTxsResult) -> (),
                                               errorCallBack: @escaping FPErrorCallback) {
        let condition = Condition(key: EventKey.TransferSender.rawValue)
        condition.eq(sender)
        
        var conditions = [Condition]()
        conditions.append(condition)

        self.searchTxs(page: page, size: size, orderBy: orderBy, conditions: conditions, successCallback: successCallback, errorCallBack: errorCallBack)

    }
    
    /**
     * 查询 Token recipient 的交易记录
     *
     * @param recipient
     * @param page
     * @param size
     * @param orderBy
     * @param blockTime
     * @return
     */
    public func searchTokenTxsByTransferRecipient(sender: String,
                                                  page: Int,
                                                  size: Int,
                                                  orderBy: String,
                                                  successCallback: @escaping (_ result: SearchTxsResult) -> (),
                                                  errorCallBack: @escaping FPErrorCallback) {
        let condition = Condition(key: EventKey.TransferRecipient.rawValue)
        condition.eq(sender)

        var conditions = [Condition]()
        conditions.append(condition)

        self.searchTxs(page: page, size: size, orderBy: orderBy, conditions: conditions, successCallback: successCallback, errorCallBack: errorCallBack)


    }
        
    func parseTxResult(queryTxResult: QueryTxResult) -> QueryTxResult {
        let code = queryTxResult.tx
        let stdTx = ProtobufUtils.deserializeTx(code: code)
        queryTxResult.stdTx = stdTx
        return queryTxResult
    }
}

struct SearchTxsParameters: Encodable {
    var query: String?
    var order_by: String?
    var page: String?
    var per_page: String?

}

struct QueryTxByHashParamterd: Encodable {
    var hash: String?
}

struct QueryBlockParamterd: Encodable {
    var height: String?
}


extension String {
    //字符串 -> 日期
    func getTimestamp(dateFormat:String = "yyyy-MM-dd 'T' HH:mm:ss") -> UInt64 {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        let date = formatter.date(from: self)
        return UInt64(date?.timeIntervalSince1970 ?? 0)
    }
}
