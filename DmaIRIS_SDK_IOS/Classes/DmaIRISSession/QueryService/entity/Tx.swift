//
//  Tx.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/16.
//

import Foundation
import HandyJSON

public class Tx: HandyJSON {
    
    required public init() {
        
    }

    public var body: Body? 
    public var authInfo: AuthInfo?
    public var signaturesList: [String] = []
}
