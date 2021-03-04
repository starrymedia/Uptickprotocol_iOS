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
                      gasLimit: UInt64 = 0,
                      privateKey: String,
                      _ callback: @escaping (_ tx: TxTx) -> Void,
                      errorCallBack: @escaping FPErrorCallback) {

        //获取公钥
        guard let publicKeyData = WalletManager.exportPublicKey(privateKey: privateKey) else {
            print("publicKeyData error")
            return
        }
        print(WalletManager.toBech32(pubkeyHexData: publicKeyData))
        //获取地址
        let address = WalletManager.exportBech32Address(privateKey: privateKey)
        AuthService.queryAccount(address: address) { (address, sequence, accountNumber) in
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
            
       

            TxService.forRequestSimulate(signerInfo: signerInfo,
                                         chainId: IRISServive.chainId,
                                         txBody: txBody,
                                         accountNumber: accountNumber,
                                         privateKey: privateKey,
                                         gasLimit: gasLimit) { tx in
                callback(tx)
            } errorCallBack: { error in
                print(error)
                errorCallBack(error)
            }



        } errorCallback: { error in
            print(error)
            errorCallBack(error)
        }

    }
    
    class func forRequestSimulate(signerInfo: TxSignerInfo,
                               chainId: String,
                               txBody:TxBody,
                               accountNumber: UInt64,
                               privateKey: String,
                               gasLimit: UInt64 = 0,
                               successCallback: @escaping (_ txSign: TxTx) -> (),
                               errorCallBack: @escaping FPErrorCallback) {
        var myGasLimit = gasLimit
        let txSign = setSignTx(signerInfo: signerInfo,
                               chainId: chainId,
                               txBody: txBody,
                               accountNumber: accountNumber,
                               privateKey: privateKey,
                               gasLimit: gasLimit)

       TxService.simulateRequest(signTx: txSign) { gasUsed in
        if myGasLimit == gasUsed {
            print("result gasUsed:\(gasUsed)")
            print("result myGasLimit:\(myGasLimit)")
            successCallback(txSign)
        } else {
            print("gasUsed:\(gasUsed)")
            print("myGasLimit:\(myGasLimit)")
            myGasLimit = gasUsed
            self.forRequestSimulate(signerInfo: signerInfo, chainId: chainId, txBody: txBody, accountNumber: accountNumber, privateKey: privateKey, gasLimit: myGasLimit, successCallback: successCallback, errorCallBack: errorCallBack)
        }
       } errorCallBack: { error in
            errorCallBack(error)
       }
    }
    
    class func setSignTx(signerInfo: TxSignerInfo,
                         chainId: String,
                         txBody:TxBody,
                         accountNumber: UInt64,
                         privateKey: String,
                         gasLimit: UInt64) -> TxTx {
        
        var gasLimint = Decimal(gasLimit)
        var gasPrice = Decimal(IRISServive.defaultGasPrice)
        //乘以0.3
        var gasPriceUp = Decimal()
        NSDecimalMultiply(&gasPriceUp, &gasLimint, &gasPrice, .plain)
        //去除小数位
        var amount = Decimal()
        NSDecimalRound(&amount, &gasPriceUp, 0, .up)

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
        
        var txSign = TxTx()
        txSign.body = txBody
        txSign.authInfo = authInfo
        
        //签名算法
        if let hashData = try? signdoc.serializedData().sha256() {

            if let sigBytes = WalletManager.signatureString(hashData: hashData, privateKey: privateKey) {
                if let bytesValue = try? BytesValue(sigBytes) {
                    txSign.signatures.append(bytesValue.value)
                }
            }

        }
        
        return txSign
    }
    
    
    class func simulateRequest(signTx: TxTx,
                               successCallback: @escaping (_ gasUsed: UInt64) -> (),
                               errorCallBack: @escaping FPErrorCallback) {

        let client = SimulateServiceClient(channel: IRISServive.channel)
        var req = SimulateRequest()
        req.tx = signTx

        let res = client.simulate(req)

        res.response.whenComplete { result in
            switch result {
            case .success(let response):
                let gasUsed = response.gasInfo.gasUsed
                successCallback(gasUsed)
            case .failure(let error):
                print(error)
                errorCallBack("\(error)")
            }
        }
    }

}

