//
//  ModeInfo.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/16.
//

import Foundation
import HandyJSON

public class ModeInfo: HandyJSON {
    public required init() {
        
    }
    
    
    public var single: Single = Single()

    public required init(single: Single) {
        self.single = single

    }
    

 
//    public init(single: Single) {
//        self.single = single
//    }
}
