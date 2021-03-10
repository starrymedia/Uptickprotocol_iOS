//
//  TransferRequest.swift
//  Alamofire
//
//  Created by StarryMedia on 2021/3/5.
//

import Foundation

struct TransferRequest: Encodable {
    
    var recipien: String?
    var denom: String?
    var tokenIds: [String]?
    var signatures: String?
    var memo: String?
    var callBack: String?
    var shares: [ShareEntity]?
}

struct ShareEntity: Encodable {
    
    var received: String?
    var rate: Double?
    
}
