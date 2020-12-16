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
    public func searchTxs(sender: String = "",
                          actionType: ActionType? = nil,
                          page: Int,
                          size: Int,
                          successCallback: @escaping (_ result: SearchTxsResult) -> (),
                          errorCallBack: @escaping FPErrorCallback) {
        
        let eventQueryBuilder = EventQueryBuilder()
        if !sender.isEmpty {
            let condition = Condition(key: EventKey.sender.rawValue)
            condition.eq(sender)
            eventQueryBuilder.addCondition(condition: condition)
        }
        
        if actionType != nil {
            let condition = Condition(key: EventKey.action.rawValue)
            condition.eq(actionType!.rawValue)
            eventQueryBuilder.addCondition(condition: condition)
        }
        
        let query = eventQueryBuilder.build()
        
        var parameters = SearchTxsParameters()
        parameters.query = query
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

    
    func parseTxResult(queryTxResult: QueryTxResult) -> QueryTxResult {
        let code = queryTxResult.tx
        let stdTx = ProtobufUtils.deserializeTx(code: code)
        queryTxResult.stdTx = stdTx
        return queryTxResult
    }
}

struct SearchTxsParameters: Encodable {
    var query: String?
    var page: String?
    var per_page: String?

}

struct QueryTxByHashParamterd: Encodable {
    var hash: String?
}
