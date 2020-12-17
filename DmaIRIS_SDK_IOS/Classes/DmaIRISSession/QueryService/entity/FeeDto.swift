//
//  FeeDto.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/16.
//

import Foundation
import HandyJSON

public class FeeDto: HandyJSON {
    required public init() {
        
    }
    public var amountList: [Coin]?
    public var payer: String?
    public var granter: String?
    public var gasLimit: UInt64?
   
}
