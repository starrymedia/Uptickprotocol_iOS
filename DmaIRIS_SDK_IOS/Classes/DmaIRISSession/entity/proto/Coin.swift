//
//  Coin.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/15.
//

import Foundation
import HandyJSON

public class Coin: HandyJSON {

    public var denom: String = ""
    public var amount: String = ""

    required public init() {
        
    }
    
    public convenience init(symbol: String, amount: String) {
        self.init()
        self.denom = symbol
        self.amount = amount
    }
    
}
