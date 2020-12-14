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
        
        TxUtils.toWei(tokenSymblol: denom, amount: Double(value) ?? 0.00) { amount in
            
            self.transferRequest(from: from,
                                 to: to,
                                 value: amount,
                                 denom: denom,
                                 privateKey: privateKey,
                                 chainId: chainId,
                                 broadcastUrl: broadcastUrl) { res in
                successCallback(res)
            } errorCallBack: { error in
                errorCallBack(error)
            }
        } errorCallBack: { error in
            errorCallBack(error)
        }

    }
    
    
    //MARK:- 更换同质化Token Owner
    public func transferRequest(from: String,
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
        
        //调用签名方法
        TxService.signTx(txBody: txBody,
                         chainId: chainId,
                         privateKey: privateKey) { tx in
            print("tx:\(tx)")
            BroadcastSession.broadcast(tx: tx) { result in
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
