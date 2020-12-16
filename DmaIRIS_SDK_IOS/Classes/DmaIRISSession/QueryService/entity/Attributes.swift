//
//  Attributes.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/16.
//

import Foundation
import HandyJSON

public class Attributes: HandyJSON {
    
    required public init() {
        
    }

    public var key: String = ""
    public var value: String = ""
    public var index: Bool = false
}

