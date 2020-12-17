//
//  LastCommit.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/17.
//

import Foundation
import HandyJSON

public class LastCommit: HandyJSON {

    public var height: String = ""
    public var round: Int = 0
    public var signatures: [Signatures] = []
    public var block_id: BlockId = BlockId()

    required public init () {
        
    }
}
 
