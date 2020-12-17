//
//  BlockHeader.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/17.
//

import Foundation
import HandyJSON

public class BlockHeader: HandyJSON {

    public var version: BlockVersion = BlockVersion()
    public var chain_id: String = ""
    public var height: String = ""
    public var time: String = ""
    public var last_block_id: LastBlockId = LastBlockId()
    public var last_commit_hash: String = ""
    public var data_hash: String = ""
    public var validators_hash: String = ""
    public var next_validators_hash: String = ""
    public var consensus_hash: String = ""
    public var app_hash: String = ""
    public var last_results_hash: String = ""
    public var evidence_hash: String = ""
    public var proposer_address: String = ""
    
    required public init() {
        
    }
}

