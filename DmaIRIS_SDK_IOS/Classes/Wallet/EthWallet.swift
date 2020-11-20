//
//  EthWallet.swift
//  DMASDK
//
//  Created by Zhangxz& on 2019/3/18.
//  Copyright © 2019 Zhangxz&. All rights reserved.
//

import UIKit
import web3swift
import BigInt
import secp256k1_swift
import SwiftProtobuf

public let WalletManager = EthWallet.default

open class EthWallet: NSObject {
//    let url:String = "http://192.168.1.104:8545"
    
    public static let `default` = EthWallet()

    public override init() {
        
    }
    var url:String?
    
    public func exportPublicKey(_ mnemonics: String) throws -> Data? {

        let prefixPath = "m/44'/118'/0'/0"
        guard let keystore = try? BIP32Keystore(mnemonics: mnemonics, prefixPath: prefixPath) else {
            throw AbstractKeystoreError.encryptionError("Failed to get keystore")
        }
        guard let serializeRootNodeString = try? keystore?.serializeRootNodeToString() else {
            throw AbstractKeystoreError.encryptionError("Failed to serializeRootNodeToString")
        }
        guard let rootNode = HDNode(serializeRootNodeString!) else {
            throw AbstractKeystoreError.encryptionError("Failed to deserialize a root node")
        }
        guard rootNode.depth == (keystore!.rootPrefix.components(separatedBy: "/").count - 1) else {
            throw AbstractKeystoreError.encryptionError("Derivation depth mismatch")
        }
        guard let index = UInt32(prefixPath.components(separatedBy: "/").last!) else {
            throw AbstractKeystoreError.encryptionError("Derivation depth mismatch")
        }
        guard let keyNode = rootNode.derive(index: index, derivePrivateKey: true) else {
            throw AbstractKeystoreError.encryptionError("Derivation failed")
        }
        return keyNode.publicKey

    }
    
 
    

    public func exportBech32Address(privateKey: String) -> String {
        guard let data = Data.fromHex(privateKey) else { return "privateKey error" }
        guard let pubkeyHexData = Web3.Utils.privateToPublic(data, compressed: true) else { return "pubkeyHexData error" }
        let str = toBech32(pubkeyHexData: pubkeyHexData)
        return str
    }

    
   public func exportBech32Address(mnemonics: String) -> String {
        guard let publicKey = try? exportPublicKey(mnemonics) else { return "privateKey error" }
        guard let pubkeyHexData = Data(base64Encoded: publicKey!.base64EncodedString()) else { return "pubkeyHexData error" }
        let str = toBech32(pubkeyHexData: pubkeyHexData)
        return str
    }
    
    public func toBech32(pubkeyHexData: Data) -> String {
        let hash = RIPEMD160.hash(message: (pubkeyHexData.sha256()))
        let data = try? SegwitAddrCoder().convertBits(instart: 0, from: 8, to: 5, pad: true, idata: hash)
        let str = Bech32().encode("iaa", values: data!)
        return str
    }
    
    public func signatureString(signDoc: String,mnemonics:String) -> String? {
        
        guard let hash = Data(base64Encoded: signDoc)?.sha256() else {
            print("signDoc error")
            return "signDoc error"
        }
        
        guard let privateKey = self.exportAddressAndPrivateKeyFromMnemonics(mnemonics: mnemonics).privateKey else {
            print("privateKey error")
            return "privateKey error"
        }

        guard let privateKeyData = Data.fromHex(privateKey) else {
            print("privateKeyData error")
            return "privateKeyData error"
        }
        let sign = SECP256K1.signForRecovery(hash: hash, privateKey: privateKeyData, useExtraEntropy: false)
        
        guard let serializedSignature = sign.serializedSignature else {
            print("sign serializedSignature error")
            return "sign serializedSignature error"
        }
        guard let signature = SECP256K1.unmarshalSignature(signatureData: serializedSignature) else {
            print("signature error")
            return "signature error"
        }
        print("r:\(signature.r.base64EncodedString() )")
        print("s:\(signature.s.base64EncodedString() )")
        let data = signature.r + signature.s
        return data.base64EncodedString()
    }
  
    /// 获取助记词
    ///
    /// - Parameter seedLen: 随机长度
    /// - Returns: 返回助记词
    func exportMnemonics() -> (String?) {
        guard let mnemonics = try?BIP39.generateMnemonics(bitsOfEntropy: 128) else {return ("")}
        return mnemonics
    }
    
    /// 钱包生成   0代表助记词 1代表私钥 2代表地址
    ///
    /// - Returns: 0代表助记词 1代表私钥 2代表地址
    func create() -> (mnemonics:String?,privateKey:String?,address:String?) {
        let prefixPath = "m/44'/118'/0'/0"
        guard let mnemonics = try?BIP39.generateMnemonics(bitsOfEntropy: 256) else {return (nil,nil,nil)}
        let keystore = try! BIP32Keystore(mnemonics: mnemonics!, prefixPath: prefixPath)

        let account = keystore?.addresses![0]
        let privateKey = try!keystore?.UNSAFE_getPrivateKeyData(password: "web3swift", account: account!).toHexString()
        let address = account?.address
        return (mnemonics,privateKey,address)
    }
    
    /// 通过助记词生成钱包地址和私钥 0私钥1钱包地址
    ///
    /// - Parameter mnemonics: 助记词
    /// - Returns: 私钥，钱包地址
   public func exportAddressAndPrivateKeyFromMnemonics(mnemonics:String) -> (privateKey:String?,address:String?) {
    
        let prefixPath = "m/44'/118'/0'/0"
        let keystore = try! BIP32Keystore(mnemonics: mnemonics, prefixPath: prefixPath)

//        let keystore = try!BIP32Keystore.init(mnemonics:mnemonics)
        let account = keystore?.addresses![0]
        let privateKey = try!keystore?.UNSAFE_getPrivateKeyData(password: "web3swift", account: account!).toHexString()
        let address = account?.address
        return (privateKey,address)
    }
    
    /// 通过私钥生成钱包地址
    ///
    /// - Parameter privateKey: 私钥
    /// - Returns: 钱包地址
   public func exportAddressFromPrivateKey(privateKey:String) -> String? {
        guard let keystoreV3 = try!EthereumKeystoreV3.init(privateKey: Data.fromHex(privateKey)!) else{ return ""}
        let keystoreManager = KeystoreManager.init([keystoreV3])
        let keystore = keystoreManager.bip32keystores
    
    
        guard let address = keystoreManager.addresses?.first?.address else {return ""}
        return address
    }
    /// 通过keystore和密码生成钱包地址和私钥 0私钥1钱包地址
    ///
    /// - Parameter keystore: 私钥
    /// - Returns: 钱包地址/私钥
    func exportAddressFromKeystore(keystore:String ,password:String) -> (privateKey:String?,address:String?) {
        guard let keystoreV3 = EthereumKeystoreV3.init(keystore) else {return (nil,nil)}
        let keystoreManager = KeystoreManager.init([keystoreV3])
        guard let account = keystoreManager.addresses?.first else {return (nil,nil)}
        guard let privateKey = try? keystoreManager.UNSAFE_getPrivateKeyData(password:password, account:account) else {return (nil,nil)}
        return (privateKey.toHexString(),account.address)
    }

    /// 通过私钥以及密码生成keystore
    ///
    /// - Parameters:
    ///   - privateKey: 私钥
    ///   - passWord: 密码
    /// - Returns: keyStore
    public func exportKeystoreFromPrivateKeyAndPassword(privateKey :String, passWord: String) -> String? {

        guard let keystoreV3 = try! EthereumKeystoreV3.init(privateKey: Data.fromHex(privateKey)!, password: passWord, aesMode:"aes-128-ctr") else {return nil}
        guard let jsonData = try? JSONEncoder().encode(keystoreV3.keystoreParams) else {return nil}
        let keystoreJson = String(data: jsonData, encoding: .utf8)
        return keystoreJson!
    }

    /// 通过地址查询钱包余额
    ///
    /// - Parameter address: 地址
    /// - Returns: 余额
    func balance(address:String) -> ContractResult {
        let web3 = Web3.new(URL(string: url!)!)
        web3?.provider.network = nil
        let account = EthereumAddress(address)

        let balanceResult = web3?.eth.getBalance(address: account!)
        switch balanceResult {
        case .success(let balance)?:

            return ContractResult.success(value:["balance":Web3.Utils.formatToPrecision(balance) as Any])
        case .failure(_)?:
            return ContractResult.failure(error: "查询失败")
        case .none:
            return ContractResult.failure(error: "查询失败")
        }
    }

    /// 转账
    ///
    /// - Parameters:
    ///   - privatekey: 私钥
    ///   - to: 转账对象
    ///   - value: 转账金额 例如eg:0.1代表0.1eth
    ///   - gasPrice: gas价格 例如Demo
    ///   - gasLimit: gas限制 例如Demo
    /// - Returns: 哈希值
    func transfer(privatekey:String,to:String,value:String,gasPrice:String,gasLimit:String) -> ContractResult {
        let keyJsonString = self.exportKeystoreFromPrivateKeyAndPassword(privateKey: privatekey, passWord: "")
        let keystore = EthereumKeystoreV3.init(keyJsonString!)
        let keystoreManager = KeystoreManager.init([keystore!])
        let account = keystoreManager.addresses![0]

        let web3 = Web3.new(URL(string: url!)!)
        web3?.provider.network = nil
        web3?.addKeystoreManager(keystoreManager)



        let toAddress = EthereumAddress(to)

        let random = web3?.eth.getTransactionCount(address: account)
        switch random {
        case .success(let res)?:

            var transaction = EthereumTransaction(gasPrice: BigUInt(gasPrice)!,
                                                  gasLimit: BigUInt(gasLimit)!,
                                                  to: toAddress!,
                                                  value: Web3.Utils.parseToBigUInt(value, units: .eth)!,
                                                  data: Data())
            transaction.nonce = res
            do {
                try Web3Signer.signTX(transaction: &transaction, keystore: keystore!, account: account, password: "")
            } catch {
                print("签名失败")
            }
            let encoded:Data? = transaction.encode()

            let sendTransation = web3?.eth.sendRawTransaction(encoded!)

            switch sendTransation {
            case .success(let res)?:
                return ContractResult.success(value:["hash":res.hash])
            case .failure(let error)?:
                return ContractResult.failure(error: error)
            case .none:
                return ContractResult.failure(error: "转账失败")
            }

        case .failure(let error)?:
            return ContractResult.failure(error: error)
        case .none:
            return ContractResult.failure(error: "获取random失败")
        }
    }
    
}

