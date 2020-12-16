//
//  SearchTxsResult.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/16.
//

import Foundation
import HandyJSON

public class QueryServiceResult: HandyJSON {
    
    required public init() {
        
    }

    public var jsonrpc: String?
    public var id: String?
    public var result: [SearchTxsResult]?

}

public class SearchTxsResult: HandyJSON {
    
    required public init() {
        
    }

    public var txs: [QueryTxResult] = []
    public var total_count: String = ""

}

