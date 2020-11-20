//
//  BankSession.swift
//  DmaIRIS_SDK_IOS
//
//  Created by StarryMedia on 2020/11/19.
//

import Foundation

extension DmaIRISSession {
    
    public func queryBalance(address: String, denom: String,_ callback: @escaping (_ balance: Coin) -> Void) {
                
        let client = BankQueryClient(channel: self.channel)
        var req = BankQueryBalanceRequest()
        req.address = address
        req.denom = denom
        let res = client.balance(req)
        res.response.whenComplete { result in
            switch result {
            case .success(let value):
                callback(value.balance)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    public func queryAllBalance(address: String, _ callback: @escaping (_ list: [Coin] ) -> Void) {
                
        let client = BankQueryClient(channel: self.channel)
        var req = BankQueryAllBalancesRequest()
        req.address = address
        let res = client.allBalances(req)
        res.response.whenComplete { result in
            switch result {
            case .success(let value):
                callback(value.balances)
            case .failure(let error):
                print(error)
            }
        }
    }

    public func queryTotalSupply(_ callback: @escaping (_ list: [Coin] ) -> Void) {
                
        let client = BankQueryClient(channel: self.channel)
        let req = BankQueryTotalSupplyRequest()

        let res = client.totalSupply(req)
        res.response.whenComplete { result in
            switch result {
            case .success(let value):
                callback(value.supply)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    public func querySupplyOf(denom: String, _ callback: @escaping (_ amount: Coin) -> Void) {
                
        let client = BankQueryClient(channel: self.channel)
        var req = BankQuerySupplyOfRequest()
        req.denom = denom
        let res = client.supplyOf(req)
        res.response.whenComplete { result in
            switch result {
            case .success(let value):
                callback(value.amount)
            case .failure(let error):
                print(error)
            }
        }
    }

}
