//
//  ViewController.swift
//  DmaIRIS_SDK_IOS
//
//  Created by 447690182@qq.com on 11/14/2020.
//  Copyright (c) 2020 447690182@qq.com. All rights reserved.
//

import UIKit
import UptickProtocolIRISnet
import GRPC
import Logging
import web3swift
import secp256k1_swift
import Alamofire

public struct PublicKey {
    var type:String = ""
    var value: String = ""

}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        IRISServive.host = "34.80.22.255"
        IRISServive.port = 9090
        IRISServive.chainId = "bifrost-2"
        MerchantService.nodeUrl = "http://52.81.146.252:8091"
        RpcService.rpcUrl = "http://34.80.22.255:26657"
        
//        TokenService.balance(address: "iaa1fu5xru6umtfqthe588z6zk37gdknulr55ee5qf",
//                             denom: "ubif") { coin in
//            print(coin.denom)
//            print(coin.amount)
//
//        } errorCallback: { error in
//            print(error)
//        }
        
        NFTService.supply(owner: "iaa1fu5xru6umtfqthe588z6zk37gdknulr55ee5qf",
                          denom: "ghjfjdjjdjdjjfjf") { result in
            print("querySupply:\(result)")
    
            
        } errorCallback: { error in
            print(error)
        }

        TokenService.allBalances(owner: "iaa1fu5xru6umtfqthe588z6zk37gdknulr55ee5qf") { list in
            print(list)
            for l in list {
                print(l.denom)
                print(l.amount)
            }
        } errorCallback: { error in
            print(error)
        }    
     }

 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

struct Login: Encodable {
    let email: String
    let password: String
}


