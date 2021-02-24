//
//  Denom.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/15.
//

import Foundation
import HandyJSON

public class Denom<T> {
    public var name: String = ""
    public var denom: String = ""
    public var create: String = "" 
    public var infos =  [T]()
    
    required public init() {
        
    }
}
