//
//  SignDataEntity.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/15.
//

import Foundation

public class SignDataEntity {
    
    var msg: String = ""
    var pubKey: String = ""
    var sig: String = ""
    
    init() {
    }
    
    convenience init(msg: String, pubKey: String, sig: String) {
        self.init()
        self.msg = msg
        self.pubKey = pubKey
        self.sig = sig
    }
    
    public func toString() -> String {
        #warning("需要修改")
        return "JSONObject.toJSONString(self);"
    }
}
