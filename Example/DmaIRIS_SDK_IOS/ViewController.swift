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

        IRISServive.host = "seed-1.mainnet.irisnet.org"
        IRISServive.port = 9090
        IRISServive.chainId = "irishub-1"
        RpcService.rpcUrl = "http://\(IRISServive.host):26657"
        MerchantService.nodeUrl = "http://52.81.146.252:8091"

        
//        iaa1padwug08sug6f2nt6xe0nvlxk5h7u9vf4qq5p5
        TokenService.balance(address: "iaa1fu5xru6umtfqthe588z6zk37gdknulr55ee5qf",
                             denom: "uiris") { coin in
            
            print(coin.amount)
         } errorCallback: { error in
            print(error)
         }
        
        NFTService.supply(owner: "iaa1fu5xru6umtfqthe588z6zk37gdknulr55ee5qf",
                          denom: "u498725bdf36a4d5d987b6b74030dd94a") { result in
            print("querySupply:\(result)")
       
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


