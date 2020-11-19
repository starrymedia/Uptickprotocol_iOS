//
//  TxService.swift
//  DmaIRIS_SDK_IOS
//
//  Created by StarryMedia on 2020/11/19.
//

import Foundation
import Alamofire

//MARK:- TxService
class TxService {
    
    class func signTx(txBody: TxBody,
                fee: TxFee,
                chainId: String,
                mnemonics: String,
                _ callback: @escaping (_ tx: Tx) -> Void) {

        //获取地址
        let publicKeyData = try? EthWallet.exportPublicKey(mnemonics)
        let address = EthWallet.exportBech32Address(mnemonics: mnemonics)
        IRIS.queryAccount(address: address) { (address, sequence, accountNumber) in
            print("address:\(address)")
            print("sequence:\(sequence)")
            print("accountNumber:\(accountNumber)")
            
            //公钥
            var publicKeyMsg = PubKey()
            publicKeyMsg.key = publicKeyData!!
            let any = TxUtils.getProtobufAny(message: publicKeyMsg, typePrefix: "")
            //类型
            var modeInfo = TxModeInfo()
            modeInfo.single.mode = .direct

            //配置签名信息
            var signerInfo = TxSignerInfo()
            signerInfo.publicKey = any!
            signerInfo.modeInfo = modeInfo
            signerInfo.sequence = sequence
            
            //认证信息
            var authInfo = TxAuthInfo()
            //签名信息
            authInfo.signerInfos.append(signerInfo)
            //交易费
            authInfo.fee = fee
            //链ID
            let chainId = chainId
            if chainId.isEmpty {
                print("chainId ie empty")
            }
            #warning("有疑问")
            //签名实体
            var signdoc = TxSignDoc()
            //交易体
            signdoc.bodyBytes = try! txBody.serializedData()
            //认证信息
            signdoc.authInfoBytes = try! txBody.serializedData()
            //地址编号
            signdoc.accountNumber = accountNumber
            //链ID
            signdoc.chainID = chainId
            
            
            //签名算法
            let hash = try? signdoc.serializedData().sha256()
            let signResult = EthWallet.signatureString(signDoc: (hash?.base64EncodedString())!, mnemonics: mnemonics)
                        
            var txSign = Tx()
            txSign.body = txBody
            txSign.authInfo = authInfo
            txSign.signatures.append(Data(base64Encoded: signResult!)!)
            
            print("txSign:\(txSign)")
            callback(txSign)

        }

    }
    
    class func broadcast(url: String,
                   tx: Tx,
                   _ callback: @escaping (_ res: String) -> Void) {
               
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
                   encoder: JSONParameterEncoder.default).response { response in
                    debugPrint(response)
                    callback("返回的值")
        }
    }
    
}
