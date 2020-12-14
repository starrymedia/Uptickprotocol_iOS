//
//  Broadcast.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/12.
//

import Foundation

public let BroadcastService = Broadcast.default

open class Broadcast {
    
    public static let `default` = Broadcast()
    open var rpcUrl = ""

    public func broadcast(tx: Tx,
                         successCallback: @escaping (_ broadcast: BroadcastModel) -> (),
                         errorCallBack: @escaping FPErrorCallback) {
               
        guard let txString = try? tx.serializedData().base64EncodedString() else {
            print("broadcast tx error")
            return
        }
        let broadcast = BroadcastRequest(id: "service_client",
                                     jsonrpc: "2.0",
                                     method: "broadcast_tx_commit",
                                     params: BroadcastRequestParams(tx: txString))

        IRISAF.postRequest(url: self.rpcUrl,parameters: broadcast) { jsonString in
            if let model = BroadcastModel.deserialize(from: jsonString) {
                successCallback(model)
            } else {
                errorCallBack("broadcast json error")
            }
        } errorCallBack: { error in
            errorCallBack("\(error)")
        }
    }
    
}

