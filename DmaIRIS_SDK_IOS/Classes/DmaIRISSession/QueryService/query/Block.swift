//
//  Block.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/17.
//

import Foundation
import HandyJSON
public class Block: HandyJSON {

    public var header: BlockHeader = BlockHeader()
    public var data: BlockData = BlockData()
    public var evidence: BlockEvidence = BlockEvidence()
    public var last_commit: LastCommit = LastCommit()

    public required init() {
        
    }
}
