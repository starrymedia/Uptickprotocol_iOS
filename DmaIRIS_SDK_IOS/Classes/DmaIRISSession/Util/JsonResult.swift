//
//  JsonResult.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/18.
//

import Foundation
import HandyJSON

public struct JsonResult<T>: HandyJSON {
    
    public var code: String?
    public var success: Bool?
    public var msg: String?
    public var data: T?
    public init() {
        
    }
    
}
