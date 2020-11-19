//
//  TransferSession.swift
//  DmaIRIS_SDK_IOS
//
//  Created by StarryMedia on 2020/11/19.
//

import Foundation

extension DmaIRISSession {
    
    //MARK:- transfer
    public func transfer(from: String,
                         to: String,
                         value: String,
                         denom: String,
                         mnemonics: String,
                         chainId: String,
                         broadcastUrl: String) {
        
        var coin = Coin()
        coin.amount = value
        coin.denom = denom
        
        var msgSend = BankMsgSend()
        msgSend.fromAddress = from
        msgSend.toAddress = to
        msgSend.amount = [coin]
    
       
        
        var txBody = TxUtils.getBody(meno: "", timeoutHeight: 0)
        if let any = TxUtils.getProtobufAny(message: msgSend, typePrefix: "") {
            txBody.messages.append(any)
        }
        
        let fee = TxUtils.getFee(gasLimit: txGasLimit,
                                 amount: txAmount,
                                 denom: txDenom)
        
        //调用签名方法
        TxService.signTx(txBody: txBody,
                         fee: fee,
                         chainId: chainId,
                         mnemonics: mnemonics) { tx in
            print("tx:\(tx)")
            TxService.broadcast(url: broadcastUrl, tx: tx) { res in
                print(res)
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