//
//  AuthSession.swift
//  DmaIRIS_SDK_IOS
//
//  Created by StarryMedia on 2020/11/19.
//

import Foundation

extension DmaIRISSession {
    
    //MARK:- Auth
    public func queryAccount(address: String,_ callback: @escaping (_ address: String, _ sequence: UInt64, _ accountNumber: UInt64) -> ()) {
        
        let client = AuthQueryClient(channel: self.channel)
        var req = AuthQueryAccountRequest()
        req.address = address

        let res = client.account(req)
        res.response.whenComplete { result in
            switch result {
            case .success(let response):
                print(response.account.value)
                if let baseAccount = try? AuthBaseAccount(serializedData: response.account.value) {
                    callback(baseAccount.address,
                             baseAccount.sequence,
                             baseAccount.accountNumber)
                }
            case .failure(let error):
                print(error)
            }
        }
     }

}
