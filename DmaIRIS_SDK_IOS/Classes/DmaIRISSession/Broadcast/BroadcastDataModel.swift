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

struct BroadcastRequest: Encodable {
    let id: String
    let jsonrpc: String
    let method: String
    let params: BroadcastRequestParams

}

struct BroadcastRequestParams: Encodable {
    let tx: String
}
