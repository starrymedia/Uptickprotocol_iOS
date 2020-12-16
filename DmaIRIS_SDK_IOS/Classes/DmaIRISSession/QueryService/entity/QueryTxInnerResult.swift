//
//  QueryTxInnerResult.swift
//  Pods
//
//  Created by StarryMedia on 2020/12/16.
//

import Foundation
import HandyJSON

public class QueryTxInnerResult: HandyJSON {
    
    required public init() {
        
    }

    public var code: Int = 0
    public var data: String = ""
    public var log: String = ""
    public var info: String = ""
    public var gas_wanted: String = ""
    public var codespace: String = ""
    public var events: [Events] = []
    public var tags: [String] = []

}
