//
//  Broadcast.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/12.
//

import Foundation
import Alamofire
import HandyJSON

public let BroadcastService = Broadcast.default

open class Broadcast {
    
    public static let `default` = Broadcast()
    open var rpcUrl = ""

    public func broadcast(tx: Tx,
                         successCallback: @escaping (_ res: String) -> (),
                         errorCallBack: @escaping FPErrorCallback) {
               
        guard let txString = try? tx.serializedData().base64EncodedString() else {
            print("broadcast tx error")
            return
        }
        let broadcast = BroadcastRequest(id: "service_client",
                                     jsonrpc: "2.0",
                                     method: "broadcast_tx_commit",
                                     params: BroadcastRequestParams(tx: txString))

        AF.request(self.rpcUrl,
                   method: .post,
                   parameters: broadcast,
                   encoder: JSONParameterEncoder.default).responseString { response in
                    switch response.result {
                    case .success(let jsonString):
                        print(jsonString)
                        if let model = BroadcastModel.deserialize(from: jsonString) {
                            if let hash = model.result?.hash {
                                successCallback(hash)
                            }
                        }
                    case .failure(let error):
                        print(error)
                        errorCallBack(error.errorDescription ?? "broadcast error")
                    }
        }
    }
    
}

struct BroadcastModel: HandyJSON {
    var jsonrpc: String?
    var id: String?
    var result: BroadcastResult?
}

struct BroadcastResult: HandyJSON {
    var hash: String?
    var height: String?
    var check_tx: BroadcastTx?
    var deliver_tx: BroadcastTx?
}

struct BroadcastTx: HandyJSON {
    var code: Int?
    var data: Any?
    var log: String?
    var info: String?
    var gas_wanted: String?
    var gas_used: String?
    var codespace: String?
    var events: [Any]?
}
