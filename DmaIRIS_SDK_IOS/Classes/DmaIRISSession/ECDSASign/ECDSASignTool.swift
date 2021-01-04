//
//  ECDSASignTool.swift
//  SwiGM
//
//  Created by StarryMedia on 2020/12/29.
//  Copyright © 2020 StarryMedia. All rights reserved.
//

import UIKit
import CommonCrypto
import secp256k1_swift
class ECDSASignTool: NSObject {
    
    
    /// ecdsaSign签名
    /// - Parameters:
    ///   - message: 欲加密文本
    ///   - privateKey: 私钥(hex格式)
    /// - Returns: 签名结果
    static func ecdsaSign(message: String, privateKey: String) -> String {
        // hash to sign
        guard let message = message.data(using: .utf8) else {
            return "";
        }
        let hash = sha256(data: message)

        guard let privateKey = hexadecimal(hexString: privateKey) else {
            print("privateKey生成出错")
            return "";
        }
        guard let publicKey = SECP256K1.privateToPublic(privateKey: privateKey) else {
            print("publicKey生成出错");
            return "";
        }

        // ecdsa signing with private key
        guard case let (serializedSignature?, rawSignature?) = SECP256K1.ecdsaSign(hash: hash, privateKey: privateKey) else {
            print("ecdsaSign 签名出错");
            return ""
        };
        // serializedSignature : compressed format R+S
        // rawSignature : low form signature
        let serializedSignature_hex = hexString(data: serializedSignature)
        return serializedSignature_hex
    }
    
    static func ecdsaVerify(msg: Data, sig: Data, pub: Data) -> Bool {
        

        let verify = SECP256K1.ecdsaVerify(hash: msg, signature: sig, publicKey: pub)
        
        return true
    }

    
//MARK: - tool
    
    static func sha256(data : Data) -> Data {
        var hash = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA256($0, CC_LONG(data.count), &hash)
        }
        return Data(bytes: hash)
    }
    
    static func hexString(data: Data) -> String {
        return data.map{ String(format:"%02x", $0) }.joined();
    }
    
    static func hexadecimal(hexString: String) -> Data? {
        var data = Data(capacity: hexString.count / 2)
        
        let regex = try! NSRegularExpression(pattern: "[0-9a-f]{1,2}", options: .caseInsensitive)
        regex.enumerateMatches(in: hexString, options: [], range: NSMakeRange(0, hexString.count)) { match, flags, stop in
            let byteString = (hexString as NSString).substring(with: match!.range)
            var num = UInt8(byteString, radix: 16)!
            data.append(&num, count: 1)
        }
        
        guard data.count > 0 else {
            return nil
        }
        
        return data
    }
    
}
