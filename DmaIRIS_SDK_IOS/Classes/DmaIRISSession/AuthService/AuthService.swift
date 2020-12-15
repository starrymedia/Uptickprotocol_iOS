//
//  AuthSession.swift
//  DmaIRIS_SDK_IOS
//
//  Created by StarryMedia on 2020/11/19.
//

import Foundation

public let AuthService = AuthServiceSession.default

open class AuthServiceSession {
        
    public static let `default` = AuthServiceSession()

    ///  查询钱包账户基本信息，只有此钱包地址在链上至少发生过一次交易（转入或转出token等）才可以查询到数据
    /// - Parameters:
    ///   - address: 钱包地址
    ///   - successCallback: address：钱包地址 ,sequence：序列号，accountNumber：地址号
    ///   - errorCallback: 错误信息
    public func queryAccount(address: String,
                             successCallback: @escaping (_ address: String, _ sequence: UInt64, _ accountNumber: UInt64) -> (),
                             errorCallback: @escaping FPErrorCallback) {
        
        let client = AuthQueryClient(channel: IRISServive.channel)
        var req = AuthQueryAccountRequest()
        req.address = address

        let res = client.account(req)
        res.response.whenComplete { result in
            switch result {
            case .success(let response):
                do {
                    let baseAccount = try AuthBaseAccount(serializedData: response.account.value)
                    successCallback(baseAccount.address,
                             baseAccount.sequence,
                             baseAccount.accountNumber)
                } catch {
                    errorCallback("queryAccount error")
                }
            case .failure(let error):
                errorCallback("\(error)")
            }
        }
     }

}
