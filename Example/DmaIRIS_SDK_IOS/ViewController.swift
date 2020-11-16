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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let mnemonics = "avoid insect cushion electric plunge hockey great able dice marriage winter way major path holiday basket topple property exit lottery regular awesome replace outer"
        let addres = EthWallet.exportBech32Address(mnemonics)
        print(addres)
        //b1fd3119cd4fe92d05640fa054fd904e3cedc3e19760c89f1cda1d52d5d7ff24
                
        let dataString = "CooBCocBChwvY29zbW9zLmJhbmsudjFiZXRhMS5Nc2dTZW5kEmcKKmlhYTF6ZmN1cHVncDJqMmZ1aGM2NW5hZ3U0bGFldGZ1ZnQzdnd6bWsyZRIqaWFhMXAwZGYzNjljczJrNzcwZXJycmhscDhtZXRjOGFmOXFocXk4ZnF6Gg0KBXVpcmlzEgQxMDAwEmYKUApGCh8vY29zbW9zLmNyeXB0by5zZWNwMjU2azEuUHViS2V5EiMKIQKIlQTR1nFyaJShUgZ6N7Sh78al2zgLBT6TOFKFuhh3XRIECgIIARgtEhIKDAoFdWlyaXMSAzEwMBDAmgwaB3Rlc3Rpbmc="
        //fAn3ha+p4ZMLuj4XnX46kRVm+pq5bXwQR+85apv87dQ3mLSheBp6AZbBs5OQmGf3mFMw3wAf72SDEM7xo1Gu4g==
        let sign = EthWallet.signatureString(signDoc: dataString, mnemonics: mnemonics)
        print("sign:\(String(describing: sign!))")
        
     }
        
    func getAccount() -> UnaryCall<Cosmos_Auth_V1beta1_QueryAccountRequest, Cosmos_Auth_V1beta1_QueryAccountResponse> {
        
        let group = PlatformSupport.makeEventLoopGroup(loopCount: 1)
        let channel = ClientConnection.insecure(group: group)
            .connect(host: "192.168.1.112", port: 9090)
        
        let client = Cosmos_Auth_V1beta1_QueryClient(channel: channel)
        var req = Cosmos_Auth_V1beta1_QueryAccountRequest()
        req.address = "iaa1zfcupugp2j2fuhc65nagu4laetfuft3vwzmk2e"

        let res = client.account(req)
        return res
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


