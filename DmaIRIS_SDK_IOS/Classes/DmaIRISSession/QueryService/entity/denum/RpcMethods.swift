//
//  RpcMethods.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/16.
//

import Foundation

public enum RpcMethods: String {

    case broadcastTxSync = "broadcast_tx_sync"
    case broadcastTxAsync = "broadcast_tx_async"
    case broadcastTxCommit = "broadcast_tx_commit"
    case abciQuery = "abci_query"
    case subscribe = "subscribe"
    case unsubscribe = "unsubscribe"
    case unsubscribeAll = "unsubscribe_all"
    case health = "health"
    case block = "block"
    case blockResults = "block_results"
    case tx = "tx"
    case txSearch = "tx_search"
    case validators = "validators"
 
}
