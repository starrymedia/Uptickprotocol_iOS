//
//  BlockResult.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/17.
//

import Foundation
import HandyJSON

public class BlockResult: HandyJSON {

    public var block_id: BlockId = BlockId()
    public var block: Block = Block()
    
    public required init() {
        
    }
}
