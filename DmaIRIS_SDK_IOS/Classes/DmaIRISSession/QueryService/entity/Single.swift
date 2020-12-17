//
//  Single.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/16.
//

import Foundation
import HandyJSON

public class Single: HandyJSON  {
    public required init() {
        
    }
    
    
    public var mode: Int?
    public init(mode: Int) {
        self.mode = mode
    }
 
}
