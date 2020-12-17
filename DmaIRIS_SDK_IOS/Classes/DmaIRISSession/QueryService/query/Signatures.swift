//
//  Signatures.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/17.
//

import Foundation
import HandyJSON

public class Signatures: HandyJSON {

    public var block_id_flag: Int = 0
    public var validator_address: String = ""
    public var timestamp: String = ""
    public var signature: String = ""

    required public init () {
        
    }
}
