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

public class SignUtils {
    
    public static func doSign(data: String, privateKey: String) -> SignDataEntity {
        
        let dataByte = dataToByte(data: data)
        var signature = Data()
//        signature = doSign(data: dataByte, privateKey: privateKey)
        
        return  SignDataEntity(msg: "data", pubKey: "pubKey", sig: "sig");

    }
    
    private static func doSign(data: Data, privateKey: Data) {
//        BigInteger privateKeyForSigning = new BigInteger(1, privateKey);
//        let privateKeyForSigning = BigInt
//        ECDSASigner signer = new ECDSASigner(new HMacDSAKCalculator(new SHA256Digest()));
//
//        SHA256Digest
//        
//        HMAC(key: <#T##SymmetricKey#>)
    }


    
    public static func verify(data: String ,sig: String, base64PubKey: String) -> Bool {
        
        return true
    }

    public static func verify(signDataEntity: SignDataEntity) -> Bool {
//        byte[] msg = dataToByte(signDataEntity.getMsg());
//        byte[] sig = new byte[0];
//        try {
//            sig = org.apache.commons.codec.binary.Hex.decodeHex(signDataEntity.getSig().toCharArray());
//        } catch (DecoderException e) {
//            e.printStackTrace();
//        }
//        byte[] pub = Base64.getDecoder().decode(signDataEntity.getPubKey());
//        return verify(msg, sig, pub);
        return true
    }
    
    public static func verify(msg: Data, sig: Data, pub: Data) -> Bool {
        
        return true
    }
    
    public static func dataToByte(data: String) -> Data {
        
        #warning("需要修改")
        return data.data(using: .utf8) ?? Data()
    }

 
}
