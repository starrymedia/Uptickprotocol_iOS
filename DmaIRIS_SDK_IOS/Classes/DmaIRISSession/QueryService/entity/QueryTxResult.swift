//
//  QueryTxResult.swift
//  Pods
//
//  Created by StarryMedia on 2020/12/16.
//

import Foundation
import HandyJSON

public class QueryTxResult: HandyJSON {
    
    required public init() {
        
    }

    public var hash: String = ""
    public var height: String = ""
    public var index: Int = 0
    public var tx_result: QueryTxInnerResult = QueryTxInnerResult()
    public var stdTx: Tx = Tx()
    public var tx: String = ""
}

