//
//  SignDataEntity.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/15.
//

import Foundation
import HandyJSON

public class SignDataEntity: HandyJSON {
    
    var msg: String = ""
    var pubKey: String = ""
    var sig: String = ""
    
    required public init() {
    }
    
    convenience init(msg: String, pubKey: String, sig: String) {
        self.init()
        self.msg = msg
        self.pubKey = pubKey
        self.sig = sig
    }
    
    public func toString() -> String {
        return self.toJSONString() ?? "\(self) json error"
    }
}
