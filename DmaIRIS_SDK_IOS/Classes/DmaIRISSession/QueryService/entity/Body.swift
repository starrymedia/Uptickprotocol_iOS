//
//  Body.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/16.
//

import Foundation
import HandyJSON

public class Body: HandyJSON {
    
    required public init() {
        
    }

    public var messages: [IrisMessage] = []
    public var memo: String = ""
    public var timeoutHeight: UInt64 = 0
    
}
