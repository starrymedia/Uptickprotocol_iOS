//
//  BankSession.swift
//  DmaIRIS_SDK_IOS
//
//  Created by StarryMedia on 2020/11/19.
//

import Foundation

public typealias FPErrorCallback = (_ error: String) -> ()

public let BankService = BankSession.default

open class BankSession {
    
    public static let `default` = BankSession()

    /// 转账
    /// - Parameters:
    ///   - from: 发送人地址
    ///   - to: 接收人地址
    ///   - value: 金额
    ///   - denom: 分类id
    ///   - privateKey: 私钥
    ///   - successCallback: successCallback description
    ///   - errorCallBack: errorCallBack description
    public func transfer(from: String,
                         to: String,
                         value: String,
                         denom: String,
                         privateKey: String,
                         successCallback: @escaping (_ res: BroadcastModel) -> (),
                         errorCallBack: @escaping FPErrorCallback) {
        
        TxUtils.toWei(tokenSymblol: denom, amount: Double(value) ?? 0.00) { amount in
            
            self.transferRequest(from: from,
                                 to: to,
                                 value: amount,
                                 denom: denom,
                                 privateKey: privateKey) { res in
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
                                 successCallback: @escaping (_ res: BroadcastModel) -> (),
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
                         privateKey: privateKey) { tx in
            BroadcastService.broadcast(tx: tx) { result in
                successCallback(result)
            } errorCallBack: { error in
                errorCallBack(error)
            }

        }
    }
    
    /// 根据分类ID查询余额
    /// - Parameters:
    ///   - address: 钱包地址
    ///   - denom: 资产分类
    ///   - successCallback: 余额
    ///   - errorCallback: 错误信息
    public func queryBalance(address: String,
                             denom: String,
                             successCallback: @escaping (_ balance: String) -> (),
                             errorCallback: @escaping FPErrorCallback) {
                
        let client = BankQueryClient(channel: IRISServive.channel)
        var req = BankQueryBalanceRequest()
        req.address = address
        req.denom = denom
        let res = client.balance(req)
        res.response.whenComplete { result in
            switch result {
            case .success(let value):
               
                TxUtils.forWei(tokenSymblol: denom,
                               amount: UInt64(value.balance.amount) ?? 0) { amount in
                    successCallback(amount)
                } errorCallBack: { error in
                    errorCallback(error)
                }
            case .failure(let error):
                errorCallback("\(error)")
            }
        }
    }
    
    
    /// 查询所有的余额
    /// - Parameters:
    ///   - address:  钱包地址
    ///   - successCallback: 所有余额
    ///   - errorCallback: 错误信息
    public func queryAllBalance(address: String,
                                successCallback: @escaping (_ balances: [Coin]) -> (),
                                errorCallback: @escaping FPErrorCallback) {
                
        let client = BankQueryClient(channel: IRISServive.channel)
        var req = BankQueryAllBalancesRequest()
        req.address = address
        let res = client.allBalances(req)
        res.response.whenComplete { result in
            switch result {
            case .success(let value):
                successCallback(value.balances)
            case .failure(let error):
                errorCallback("\(error)")
            }
        }
    }

 
    
    /// TotalSupply
    /// - Parameters:
    ///   - successCallback: successCallback description
    ///   - errorCallback: errorCallback description
    public func queryTotalSupply(successCallback: @escaping (_ coins: [Coin]) -> (),
                                 errorCallback: @escaping FPErrorCallback) {
                
        let client = BankQueryClient(channel: IRISServive.channel)
        let req = BankQueryTotalSupplyRequest()

        let res = client.totalSupply(req)
        res.response.whenComplete { result in
            switch result {
            case .success(let value):
                successCallback(value.supply)
            case .failure(let error):
                errorCallback("\(error)")
            }
        }
    }
    
    
    /// SupplyOf
    /// - Parameters:
    ///   - denom: 分类id
    ///   - successCallback: successCallback description
    ///   - errorCallback: errorCallback description
    public func querySupplyOf(denom: String,
                              successCallback: @escaping (_ coin: Coin) -> (),
                              errorCallback: @escaping FPErrorCallback) {
                
        let client = BankQueryClient(channel: IRISServive.channel)
        var req = BankQuerySupplyOfRequest()
        req.denom = denom
        let res = client.supplyOf(req)
        res.response.whenComplete { result in
            switch result {
            case .success(let value):
                successCallback(value.amount)
            case .failure(let error):
                errorCallback("\(error)")
            }
        }
    }

}
