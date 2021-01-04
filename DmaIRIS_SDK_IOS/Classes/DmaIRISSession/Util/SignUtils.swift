//
//  SignUtils.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/15.
//

import Foundation
import BigInt
import web3swift
import secp256k1_swift
import CryptoKit
import NIOSSL
import Security

public class SignUtils {
    
    public static func doSignDataEntity(data: String, privateKey: String) -> SignDataEntity {
        
        let sig = ECDSASignTool.ecdsaSign(message: data, privateKey: privateKey)
        return  SignDataEntity(msg: data, pubKey: sig.1, sig: sig.0);
    }

    public static func verify(signDataEntity: SignDataEntity) -> Bool {
        let msg = dataToByte(data: signDataEntity.msg)
        let sig = Data.fromHex(signDataEntity.sig)
        let pub = Data(base64Encoded: signDataEntity.pubKey)
        return verify(msg: msg, sig: sig!, pub: pub!)
    }
    
    public static func verify(data: String ,sig: String, base64PubKey: String) -> Bool {
        let msg = dataToByte(data: data)
        let signature = Data.fromHex(sig)!
        let pub = Data(base64Encoded: base64PubKey)
        return verify(msg: msg, sig: signature, pub: pub!)
    }


    public static func dataToByte(data: String) -> Data {
        
        return data.data(using: .utf8) ?? Data()
    }
    
    static func verify(msg: Data, sig: Data, pub: Data) -> Bool {
        print(String(data: msg, encoding: .utf8))
        print(sig.toHexString())
        print(pub.base64EncodedString())
        let verify = ECDSASignTool.ecdsaVerify(msg: msg, sig: sig, pub: pub)
        return verify 
    }
     
}

 
