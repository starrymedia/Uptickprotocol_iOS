//
//  TxService.swift
//  DmaIRIS_SDK_IOS
//
//  Created by StarryMedia on 2020/11/19.
//

import Foundation
import Alamofire
import HandyJSON
import SwiftProtobuf
import secp256k1_swift

//MARK:- TxService
open class TxService {
    

    class func signTx(txBody: TxBody,
                chainId: String,
                privateKey: String,
                _ callback: @escaping (_ tx: Tx) -> Void) {

        //获取公钥
        guard let publicKeyData = WalletManager.exportPublicKey(privateKey: privateKey) else {
            print("publicKeyData error")
            return
        }
        print(WalletManager.toBech32(pubkeyHexData: publicKeyData))
        //获取地址
        let address = WalletManager.exportBech32Address(privateKey: privateKey)
        IRIS.queryAccount(address: address) { (address, sequence, accountNumber) in
            print("address:\(address)")
            print("sequence:\(sequence)")
            print("accountNumber:\(accountNumber)")
            
            //公钥
            var publicKeyMsg = PubKey()
            if let bytesValue = try? BytesValue(publicKeyData) {
                print(bytesValue)
                publicKeyMsg.key = bytesValue.value
            }
           
            //类型
            var modeInfo = TxModeInfo()
            modeInfo.single.mode = .direct

            //配置签名信息
            var signerInfo = TxSignerInfo()
            signerInfo.modeInfo = modeInfo
            signerInfo.sequence = sequence
            if let any = TxUtils.getProtobufAny(message: publicKeyMsg, typePrefix: "") {
                signerInfo.publicKey = any
            }
            
//            var gasLimint = Decimal(txGasLimit)
//            var gasPrice = Decimal(0.025)
//            var gasPriceUp = Decimal()
//            NSDecimalRound(&gasPriceUp, &gasPrice, 0, .up)
//            print(gasPriceUp)
//
//            var amount = Decimal()
//            NSDecimalMultiply(&amount, &gasLimint, &gasPriceUp, .plain)
//            print(amount)
//            var amountString = NSDecimalString(&amount, nil)
//            let fee = TxUtils.getFee(gasLimit: txGasLimit,
//                                     amount: amountString,
//                                     denom: txDenom)
//
//
//            //认证信息
//            var authInfo = TxAuthInfo()
//            //签名信息
//            authInfo.signerInfos.append(signerInfo)
//            //交易费
//            authInfo.fee = fee
//            //链ID
//            let chainId = chainId
//            if chainId.isEmpty {
//                print("chainId ie empty")
//                return
//            }
//            //签名实体
//            var signdoc = TxSignDoc()
//            //交易体
//            signdoc.bodyBytes = try! txBody.serializedData()
//            //认证信息
//            signdoc.authInfoBytes = try! authInfo.serializedData()
//
//            //地址编号
//            signdoc.accountNumber = accountNumber
//            //链ID
//            signdoc.chainID = chainId
//
//            var txSign = Tx()
//            txSign.body = txBody
//            txSign.authInfo = authInfo
//
//            //签名算法
//            if let hashData = try? signdoc.serializedData().sha256() {
//
//                if let sigBytes = TxService.signatureString(hashData: hashData, privateKey: privateKey) {
//                    if let bytesValue = try? BytesValue(sigBytes) {
//                        print(bytesValue)
//                        txSign.signatures.append(bytesValue.value)
//                    }
//                }
//
//            }

            var gasLimit:UInt64 = 200000
            let dispatchQueue = DispatchQueue(label: "serial")
            let semaphoreSignal = DispatchSemaphore(value: 0)
            dispatchQueue.async {
               
                let txSign = setSignTx(signerInfo: signerInfo,
                                       chainId: chainId,
                                       txBody: txBody,
                                       accountNumber: accountNumber,
                                       privateKey: privateKey,
                                       gasLimit: gasLimit)
               
               TxService.simulateRequest(signTx: txSign) { gasUsed in
                    print("1===:\(gasUsed)")
                    print("1===:\(gasLimit)")
                if gasLimit == gasUsed {
                    print("1=============")
                } else {
                    gasLimit = gasUsed
                }
                   semaphoreSignal.signal()

               } errorCallBack: { _ in
                   
               }
               
            }
            
            dispatchQueue.async {
                semaphoreSignal.wait()

                let txSign = setSignTx(signerInfo: signerInfo,
                                       chainId: chainId,
                                       txBody: txBody,
                                       accountNumber: accountNumber,
                                       privateKey: privateKey,
                                       gasLimit: gasLimit)
               
               TxService.simulateRequest(signTx: txSign) { gasUsed in
                    print("2===:\(gasUsed)")
                    print("2===:\(gasLimit)")
                if gasLimit == gasUsed {
                    print("2=============")
                } else {
                    gasLimit = gasUsed
                }
                   semaphoreSignal.signal()

               } errorCallBack: { _ in
                   
               }
               
            }
            
            dispatchQueue.async {
                semaphoreSignal.wait()
                let txSign = setSignTx(signerInfo: signerInfo,
                                       chainId: chainId,
                                       txBody: txBody,
                                       accountNumber: accountNumber,
                                       privateKey: privateKey,
                                       gasLimit: gasLimit)
               
               TxService.simulateRequest(signTx: txSign) { gasUsed in
                   print("3===:\(gasUsed)")
            print("3===:\(gasLimit)")
                if gasLimit == gasUsed {
                    print("3=============")
                } else {
                    gasLimit = gasUsed
                }
                   semaphoreSignal.signal()

               } errorCallBack: { _ in
                   
               }
               
            }
            
     
            
      
            

            
//            for index in 0..<10 {
//                print(index)
//                print(gasLimit)
//                DispatchQueue.global().async {
//                    semaphoreSignal.wait()
//
//                     let txSign = setSignTx(signerInfo: signerInfo,
//                                            chainId: chainId,
//                                            txBody: txBody,
//                                            accountNumber: accountNumber,
//                                            privateKey: privateKey,
//                                            gasLimit: gasLimit)
//
//                    TxService.simulateRequest(signTx: txSign) { gasUsed in
//                        print(gasUsed)
//                        if gasLimit == gasUsed {
//                            callback(txSign)
//                            print(gasLimit)
//                        } else {
//                            gasLimit = gasUsed
//                            print(gasLimit)
//                         }
//                        semaphoreSignal.signal()
//
//                    } errorCallBack: { _ in
//
//                    }
//
//                    }
//
//            }
//
        } errorCallback: { error in
            print(error)
        }
        
    }
    
    class func setSignTx(signerInfo: TxSignerInfo,
                         chainId: String,
                         txBody:TxBody,
                         accountNumber: UInt64,
                         privateKey: String,
                         gasLimit: UInt64) -> Tx {
        
        var gasLimint = Decimal(gasLimit)
        var gasPrice = Decimal(0.025)
        var gasPriceUp = Decimal()
        NSDecimalRound(&gasPriceUp, &gasPrice, 0, .up)
        
        var amount = Decimal()
        NSDecimalMultiply(&amount, &gasLimint, &gasPriceUp, .plain)
        var amountString = NSDecimalString(&amount, nil)
        let fee = TxUtils.getFee(gasLimit: gasLimit,
                                 amount: amountString,
                                 denom: txDenom)


        //认证信息
        var authInfo = TxAuthInfo()
        //签名信息
        authInfo.signerInfos.append(signerInfo)
        //交易费
        authInfo.fee = fee
        //签名实体
        var signdoc = TxSignDoc()
        //交易体
        signdoc.bodyBytes = try! txBody.serializedData()
        //认证信息
        signdoc.authInfoBytes = try! authInfo.serializedData()

        //地址编号
        signdoc.accountNumber = accountNumber
        //链ID
        signdoc.chainID = chainId
        
        var txSign = Tx()
        txSign.body = txBody
        txSign.authInfo = authInfo
        
        //签名算法
        if let hashData = try? signdoc.serializedData().sha256() {

            if let sigBytes = TxService.signatureString(hashData: hashData, privateKey: privateKey) {
                if let bytesValue = try? BytesValue(sigBytes) {
                    txSign.signatures.append(bytesValue.value)
                }
            }

        }
        
        return txSign
    }
    
    class func broadcast(url: String,
                   tx: Tx,
                   successCallback: @escaping (_ res: String) -> (),
                   errorCallBack: @escaping FPErrorCallback) {
               
        guard let txString = try? tx.serializedData().base64EncodedString() else {
            print("broadcast tx error")
            return
        }
        let broadcast = BroadcastRequest(id: "service_client",
                                     jsonrpc: "2.0",
                                     method: "broadcast_tx_commit",
                                     params: BroadcastRequestParams(tx: txString))

        AF.request(url,
                   method: .post,
                   parameters: broadcast,
                   encoder: JSONParameterEncoder.default).responseString { response in
                    switch response.result {
                    case .success(let jsonString):
                        print(jsonString)
                        if let model = BroadcastModel.deserialize(from: jsonString) {
                            if let hash = model.result?.hash {
                                successCallback(hash)
                            }
                        }
                    case .failure(let error):
                        print(error)
                        errorCallBack(error.errorDescription ?? "broadcast error")
                    }
        }
    }
    
    open class func signatureString(hashData: Data, privateKey: String) -> Data? {
        
        guard let privateKeyData = Data.fromHex(privateKey) else {
            print("privateKeyData error")
            return nil
        }
        let sign = SECP256K1.signForRecovery(hash: hashData, privateKey: privateKeyData, useExtraEntropy: false)
        
        guard let serializedSignature = sign.serializedSignature else {
            print("sign serializedSignature error")
            return nil
        }
        guard let signature = SECP256K1.unmarshalSignature(signatureData: serializedSignature) else {
            print("signature error")
            return nil
        }
//        print("r:\(signature.r.base64EncodedString() )")
//        print("s:\(signature.s.base64EncodedString() )")
        let data = signature.r + signature.s
        return data
    }
    
    
    class func simulateRequest(signTx: Tx,
                               successCallback: @escaping (_ gasUsed: UInt64) -> (),
                               errorCallBack: @escaping FPErrorCallback) {

        let client = Cosmos_Base_Simulate_V1beta1_SimulateServiceClient(channel: IRIS.channel)
        var req = Cosmos_Base_Simulate_V1beta1_SimulateRequest()
        req.tx = signTx

        let res = client.simulate(req)
        res.response.whenComplete { result in
            switch result {
            case .success(let response):
                let gasUsed = response.gasInfo.gasUsed
                successCallback(gasUsed)
            case .failure(let error):
                print(error)
                errorCallBack(error.localizedDescription)
            }
        }
    }
    
    

}

struct BroadcastModel: HandyJSON {
    var jsonrpc: String?
    var id: String?
    var result: BroadcastResult?
}

struct BroadcastResult: HandyJSON {
    var hash: String?
    var height: String?
    var check_tx: BroadcastTx?
    var deliver_tx: BroadcastTx?
}

struct BroadcastTx: HandyJSON {
    var code: Int?
    var data: Any?
    var log: String?
    var info: String?
    var gas_wanted: String?
    var gas_used: String?
    var codespace: String?
    var events: [Any]?
}
