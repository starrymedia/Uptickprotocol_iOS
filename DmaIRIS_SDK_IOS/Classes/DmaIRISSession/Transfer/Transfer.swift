//
//  TransferSession.swift
//  DmaIRIS_SDK_IOS
//
//  Created by StarryMedia on 2020/11/19.
//

import Foundation

extension DmaIRISSession {
    
    //MARK:- 更换同质化Token Owner
    public func transfer(from: String,
                         to: String,
                         value: String,
                         denom: String,
                         privateKey: String,
                         chainId: String,
                         broadcastUrl: String,
                         successCallback: @escaping (_ res: String) -> (),
                         errorCallBack: @escaping FPErrorCallback) {
        
        var coin = Coin()
        coin.amount = value
        coin.denom = denom
        
        var msgSend = BankMsgSend()
        msgSend.fromAddress = from
        msgSend.toAddress = to
        msgSend.amount.append(coin)
        
        var txBody = TxUtils.getBody(meno: "", timeoutHeight: 0)
        if let any = TxUtils.getProtobufAny(message: msgSend, typePrefix: "") {
            txBody.messages.append(any)
        }
        
        let fee = TxUtils.getFee(gasLimit: txGasLimit,
                                 amount: txAmount,
                                 denom: txDenom)
        
        //调用签名方法
        TxService.signTx(txBody: txBody,
                         chainId: chainId,
                         privateKey: privateKey) { tx in
            print("tx:\(tx)")
            TxService.broadcast(url: broadcastUrl, tx: tx) { result in
                successCallback(result)
            } errorCallBack: { error in
                errorCallBack(error)
            }

        }
    }
}

struct BroadcastRequest: Encodable {
    let id: String
    let jsonrpc: String
    let method: String
    let params: BroadcastRequestParams

}

struct BroadcastRequestParams: Encodable {
    let tx: String
}
