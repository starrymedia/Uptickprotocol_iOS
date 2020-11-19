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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        iaa1xywd0k3cj5lc8ugujpxp45ejpvmhh3303zu5pq
        MerchantSession.getTokensByAddress(address: "iaa1xywd0k3cj5lc8ugujpxp45ejpvmhh3303zu5pq", denom: "ces6") { tokens in
            print(tokens)
        }
        return
        
        let mnemonics = "avoid insect cushion electric plunge hockey great able dice marriage winter way major path holiday basket topple property exit lottery regular awesome replace outer"
//        let address = EthWallet.exportBech32Address(mnemonics: mnemonics)
//        print(address)
        
        //b1fd3119cd4fe92d05640fa054fd904e3cedc3e19760c89f1cda1d52d5d7ff24
                
        let dataString = "CooBCocBChwvY29zbW9zLmJhbmsudjFiZXRhMS5Nc2dTZW5kEmcKKmlhYTF6ZmN1cHVncDJqMmZ1aGM2NW5hZ3U0bGFldGZ1ZnQzdnd6bWsyZRIqaWFhMXAwZGYzNjljczJrNzcwZXJycmhscDhtZXRjOGFmOXFocXk4ZnF6Gg0KBXVpcmlzEgQxMDAwEmYKUApGCh8vY29zbW9zLmNyeXB0by5zZWNwMjU2azEuUHViS2V5EiMKIQKIlQTR1nFyaJShUgZ6N7Sh78al2zgLBT6TOFKFuhh3XRIECgIIARgtEhIKDAoFdWlyaXMSAzEwMBDAmgwaB3Rlc3Rpbmc="
        //fAn3ha+p4ZMLuj4XnX46kRVm+pq5bXwQR+85apv87dQ3mLSheBp6AZbBs5OQmGf3mFMw3wAf72SDEM7xo1Gu4g==
        let sign = EthWallet.signatureString(signDoc: dataString, mnemonics: mnemonics)
        print("sign:\(String(describing: sign!))")

        let address = "iaa1zfcupugp2j2fuhc65nagu4laetfuft3vwzmk2e"
        
        IRIS.queryAccount(address: address) { (address, sequence, accountNumber) in
            print("address:\(address)")
            print("sequence:\(sequence)")
            print("accountNumber:\(accountNumber)")
        }
        
        
//
//        IRIS.queryBalance(address: address,denom: "uiris") { (balance, denom) in
//            print("balance:\(balance)")
//            print("denom:\(denom)")
//        }
//
//        IRIS.queryAllBalance(address: address) { list in
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


