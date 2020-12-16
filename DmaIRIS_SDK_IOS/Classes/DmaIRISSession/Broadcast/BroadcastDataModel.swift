//
//  BroadcastDataModel.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/14.
//

import Foundation
import HandyJSON

public struct BroadcastModel: HandyJSON {
    public init() { }
    public var jsonrpc: String?
    public var id: String?
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

public struct BroadcastRequest<T:Encodable>: Encodable {
    let id: String
    let jsonrpc: String
    let method: String
    let params: T
    
    public init(id: String, jsonrpc: String, method: String, params: T) {
        self.id = id
        self.jsonrpc = jsonrpc
        self.method = method
        self.params = params
    }

}

public struct BroadcastRequestParams: Encodable {
    public let tx: String
    
    public init(tx: String) {
        self.tx = tx
    }
}
