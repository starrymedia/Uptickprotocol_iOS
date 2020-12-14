//
//  TransferSession.swift
//  DmaIRIS_SDK_IOS
//
//  Created by StarryMedia on 2020/11/19.
//

import Foundation

extension DmaIRISSession {
    
  
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
