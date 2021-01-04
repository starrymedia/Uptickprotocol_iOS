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
        
        let privateKeyData = Data.fromHex(privateKey)
        let sig = ECDSASignTool.ecdsaSign(message: data, privateKey: privateKey)
        let encoded = SECP256K1.privateToPublic(privateKey: privateKeyData!, compressed: true)
        let pubKey = encoded?.base64EncodedString()
        return  SignDataEntity(msg: data, pubKey: pubKey!, sig: sig);
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
    
    public static func verify(msg: Data, sig: Data, pub: Data) -> Bool {
        
        let verify = ECDSASignTool.ecdsaVerify(msg: msg, sig: sig, pub: pub)
        return verify
        #warning("有疑问")
 
    }
     
}

 
