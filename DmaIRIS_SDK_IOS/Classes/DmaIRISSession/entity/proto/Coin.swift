//
//  Coin.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/15.
//

import Foundation

public class Coin {

    var symbol: String = ""
    var amount: Decimal = 0

    init() {
        
    }
    
    convenience init(symbol: String, amount: Decimal) {
        self.init()
        self.symbol = symbol
        self.amount = amount
    }
    
}
