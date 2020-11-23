//
//  ViewController.swift
//  DmaIRIS_SDK_IOS
//
//  Created by 447690182@qq.com on 11/14/2020.
//  Copyright (c) 2020 447690182@qq.com. All rights reserved.
//

import UIKit
import DmaIRIS_SDK_IOS
import GRPC
import Logging
import web3swift
import secp256k1_swift
import Alamofire

let RpcURI = "http://52.81.146.252:26657"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mnemonic="little vibrant order rebel buddy decide notable pistol save pretty basic uncover opera split ancient surround ball iron sport eager onion lawn inch obvious"
        let from="iaa1xywd0k3cj5lc8ugujpxp45ejpvmhh3303zu5pq"
        let to="iaa1ufnjelwg276r2xjj7cvs7le5esca59tmtcl7ve";
        let value="100";
        let privateKey="1779b474da9ef4aef67271f455dd58054d3181863b91f63910074f3cb9123591";
        let RpcURI = "http://52.81.146.252:26657"
                   

//        let str1 = WalletManager.exportAddressAndPrivateKeyFromMnemonics(mnemonics: mnemonic)
//        let str2 = WalletManager.exportBech32Address(privateKey: privateKey)
//        print(str1.privateKey)
//        print(str1.address)
//        print(str2)
        
        IRIS.queryBalance(address: from,denom: "ubif") { cion in
            print("cion:\(cion)")
            
        } errorCallback: { error in
            print(error)
        }
        
        IRIS.transfer(from: from,
                      to: to,
                      value: value,
                      denom: "ubif",
                      privateKey: privateKey,
                      chainId: "testing",
                      broadcastUrl: RpcURI) { res in
            print("res=====\(res)")
        }
        

        
        
        
//        let mnemonics = "avoid insect cushion electric plunge hockey great able dice marriage winter way major path holiday basket topple property exit lottery regular awesome replace outer"
//        let address = EthWallet.exportBech32Address(mnemonics: mnemonics)
//        print(address)
        
        //b1fd3119cd4fe92d05640fa054fd904e3cedc3e19760c89f1cda1d52d5d7ff24
                

//
//
//        IRIS.queryAccount(address: address) { (address, sequence, accountNumber) in
//            print("address:\(address)")
//            print("sequence:\(sequence)")
//            print("accountNumber:\(accountNumber)")
//        }
        
        
//
 
//
//        IRIS.queryAllBalance(address: "iaa1xywd0k3cj5lc8ugujpxp45ejpvmhh3303zu5pq") { list in
//            print("balances:\(list)")
//        }

//        IRIS.queryTotalSupply { list in
//            print(list)
//
//        }
        
//        IRIS.querySupplyOf(denom: "uiris") { (amount, denom) in
//            print(amount)
//            print(denom)
//        }
        
     

//        let login = Login(email: "test@test.test", password: "testPassword")
//
//        AF.request("https://httpbin.org/post",
//                   method: .post,
//                   parameters: login,
//                   encoder: JSONParameterEncoder.default).response { response in
//            debugPrint(response)
//        }
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


