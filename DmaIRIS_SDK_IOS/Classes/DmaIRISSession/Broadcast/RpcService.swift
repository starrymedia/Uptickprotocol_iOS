//
//  Broadcast.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/12.
//

import Foundation

public let RpcService = RpcServiceSession.default

open class RpcServiceSession {
    
    public static let `default` = RpcServiceSession()
    open var rpcUrl = ""

    public func broadcast(tx: TxTx,
                          method: RpcMethods,
                          successCallback: @escaping (_ broadcast: BroadcastModel) -> (),
                          errorCallBack: @escaping FPErrorCallback) {
               
        guard let txString = try? tx.serializedData().base64EncodedString() else {
            print("broadcast tx error")
            return
        }
        
        let params = BroadcastRequestParams(tx: txString)

        self.request(method: method, params: params) { jsonString in
            if let model = BroadcastModel.deserialize(from: jsonString) {
                successCallback(model)
            } else {
                errorCallBack("broadcast json error")
            }
        } errorCallBack: { error in
            errorCallBack("\(error)")
        }
    }
    
    public func request<Parameters: Encodable>(method: RpcMethods,
                                               params: Parameters,
                                               successCallback: @escaping (_ jsonString: String) -> (),
                                               errorCallBack: @escaping FPErrorCallback) {

        let parameters = BroadcastRequest(id: "service_client",
                                          jsonrpc: "2.0",
                                          method: method.rawValue,
                                          params: params)

        IRISAF.postRequest(url: self.rpcUrl,parameters: parameters) { jsonString in
            successCallback(jsonString)
        } errorCallBack: { error in
            errorCallBack("\(error)")
        }
    }
    
}

