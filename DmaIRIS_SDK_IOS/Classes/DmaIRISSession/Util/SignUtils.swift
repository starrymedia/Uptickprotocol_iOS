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
        
        let dataByte = dataToByte(data: data)
        let privateKeyData = Data.fromHex(privateKey)
        var signature = doSign(data: dataByte, privateKey: privateKeyData!)
        
        let sig = signature.toHexString()
        
        let encoded = SECP256K1.privateToPublic(privateKey: privateKeyData!, compressed: true)
        let pubKey = encoded?.base64EncodedString()
        return  SignDataEntity(msg: data, pubKey: pubKey!, sig: sig);
        
        
    }
    
    private static func doSign(data: Data, privateKey: Data) -> Data {
        
        print(data)
        print(privateKey)
        let privateKeyData = privateKey
        let sign = SECP256K1.signForRecovery(hash: data, privateKey: privateKeyData, useExtraEntropy: false)
//        let serializedSignature = sign.serializedSignature
//        let signature = SECP256K1.unmarshalSignature(signatureData: serializedSignature!)
//        let data = signature!.r + signature!.s
        

//        BigInt(1).power(privateKey, modulus: privateKey)
        //        BigInteger privateKeyForSigning = new BigInteger(1, privateKey);
//              ECDSASigner signer = new ECDSASigner(new HMacDSAKCalculator(new SHA256Digest()));

        
//              ECPrivateKeyParameters privKey = new ECPrivateKeyParameters(privateKeyForSigning, ECKey.CURVE);
//              signer.init(true, privKey);
//
//              byte[] r;
//              byte[] s;
//              do {
//                  do {
//                      BigInteger[] components = signer.generateSignature(Sha256Hash.hash(data));
//                      r = Utils.bigIntegerToBytes(components[0], 32);
//                      s = Utils.bigIntegerToBytes(components[1], 32);
//                  } while (r.length > 32);
//              } while (s.length > 32);
//
//              byte[] signature = new byte[r.length + s.length];
//              System.arraycopy(r, 0, signature, 0, r.length);
//              System.arraycopy(s, 0, signature, r.length, s.length);
//              return signature;
        #warning("有疑问")
        
        return Data()

    }


    public static func verify(signDataEntity: SignDataEntity) -> Bool {
        let msg = dataToByte(data: signDataEntity.msg)
        let sig = Data.fromHex(signDataEntity.sig)
        let pub = Data(base64Encoded: signDataEntity.pubKey)
        return verify(msg: msg, sig: sig!, pub: pub!)
    }
    
    public static func verify(data: String ,sig: String, base64PubKey: String) -> Bool {
        #warning("有疑问")
        let msg = dataToByte(data: data)
        let signature = Data.fromHex(sig)!
        let pub = Data(base64Encoded: base64PubKey)
        return verify(msg: msg, sig: signature, pub: pub!)
    }


    public static func dataToByte(data: String) -> Data {
        
        return data.data(using: .utf8) ?? Data()
    }
    
    public static func verify(msg: Data, sig: Data, pub: Data) -> Bool {
        
        #warning("有疑问")
//        if (sig.length != 64) {
//                return false;
//            } else {
//                byte[] rb = new byte[sig.length / 2];
//                byte[] sb = new byte[sig.length / 2];
//                System.arraycopy(sig, 0, rb, 0, rb.length);
//                System.arraycopy(sig, sb.length, sb, 0, sb.length);
//                BigInteger r = parseBigIntegerPositive(new BigInteger(rb), rb.length * 8);
//                BigInteger s = parseBigIntegerPositive(new BigInteger(sb), rb.length * 8);
//
//                msg = Sha256Hash.hash(msg);
//                X9ECParameters curve = SECNamedCurves.getByName("secp256k1");
//                ECDSASigner signer = new ECDSASigner(new HMacDSAKCalculator(new SHA256Digest()));
//                ECPublicKeyParameters publicKey = new ECPublicKeyParameters(curve.getCurve().decodePoint(pub), ECKey.CURVE);
//                signer.init(false, publicKey);
//                return signer.verifySignature(msg, r, s);
//            }
        return true
    }
    
//    private static BigInteger parseBigIntegerPositive(BigInteger b, int bitlen) {
//           if (b.compareTo(BigInteger.ZERO) < 0) {
//               b = b.add(BigInteger.ONE.shiftLeft(bitlen));
//           }
//
//           return b;
//       }
//

 
}

 
