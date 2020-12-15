//
//  DataStandard.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/15.
//

import Foundation

public class DataStandard<T>  {
    
    var protoc: String = ""
    var body: T? = nil
    var signature: Signature? = nil

    public func sign(signPriKey: String, pubKeyEnum: PublicKeyEnum) {

        let body = self.body
        if body != nil {
            let bodySort = dataSort()
            var signDataEntity: SignDataEntity!
            switch pubKeyEnum {
            case .base64:
                signDataEntity = SignUtils.doSign(data: bodySort, privateKey: signPriKey)
                break
            default:
                print("Public key type not supported")
                break
            }
            
            let pubKey = PublicKey()
            pubKey.value = signDataEntity.pubKey
            pubKey.type = pubKeyEnum.rawValue
            
            let signature = Signature()
            signature.pubKey = pubKey
            signature.sigData = signDataEntity.sig
            
            self.signature = signature
        }
    }
    
    public func verify(verifyKey: String) -> Bool {
        if (self.body != nil && self.signature != nil) {
            
            let pubKey = self.signature?.pubKey

            if (pubKey == nil) {
                
                return false
            }
            
            if (!verifyKey.isEmpty) {
                if (!pubKey!.value.isEmpty && verifyKey == pubKey!.value) {
                    
                } else {
                    return false
                }

            }
            
            let signType = pubKey!.type
            let pubKeyEnum = PublicKeyEnum(rawValue: signType)

            var falg = false
            switch (pubKeyEnum) {
            case .base64:
                falg = base64Verify(sig: self.signature!.sigData, base64PubKey: pubKey!.value);
            default:
                print("Public key type not supported")
            }

            return falg

        }
        return false

    }
    
    public func base64Verify(sig: String, base64PubKey:String) -> Bool {
        let bodySort = dataSort()        
        return SignUtils.verify(data: bodySort, sig: sig, base64PubKey: base64PubKey);
        return false

    }


    
    public func dataSort() -> String {
        if (self.body == nil) {
            return "";
        }
        #warning("需要修改")
        let bodyStr = "JSONObject.toJSONString(body);"
        let bodySort = "ObjectUtils.sortJson(bodyStr);"
        return bodySort;
    }

    public func toString() -> String {
        #warning("需要修改")
        return "JSONObject.toJSONString(this);"
    }
    
  

}


public enum PublicKeyEnum: String {
    case base64 = "/uptick.base64"
}

public class Signature  {

    var sigData: String = ""
    var pubKey: PublicKey? = nil
}

public class PublicKey {
    public var type:String = ""
    public var value: String = ""
}



