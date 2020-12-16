//
//  Coin.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/15.
//

import Foundation

public class Coin {

    var denom: String = ""
    var amount: String = ""

    init() {
        
    }
    
    convenience init(symbol: String, amount: String) {
        self.init()
        self.denom = symbol
        self.amount = amount
    }
    
}
