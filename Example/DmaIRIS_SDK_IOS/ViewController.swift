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
        RpcService.rpcUrl = "http://34.80.22.255:26657"
//        let sender = "iaa1fu5xru6umtfqthe588z6zk37gdknulr55ee5qf"
//        QueryService.searchTxs(sender: sender,
//                               page: 1,
//                               size: 10) { result in
//            print(result.toJSON())
//        } errorCallBack: { error in
//            print(error)
//
//        }
        
        let hash = "02E7499ACB7A968D286127F57180CEA7E718ACC181FF199DE9F878CAE3F92BCA"
        QueryService.queryTxByHash(hash: hash) { result in
            print(result.toJSON())
        } errorCallBack: { error in
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


