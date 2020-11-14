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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let mnemonics = "pattern movie width still leave scale exist mystery face system artist void arctic sleep absurd lunch snack patient humble lunar because wing april inject"
        
        let address = EthWallet.exportBech32Address(mnemonics)
        print("address:\(address)")
                
        
        let group = PlatformSupport.makeEventLoopGroup(loopCount: 1)

        // Setup a logger for debugging.
        var logger = Logger(label: "gRPC", factory: StreamLogHandler.standardOutput(label:))
        logger.logLevel = .debug

        // Create a connection secured with TLS to Google's speech service running on our `EventLoopGroup`
        let channel = ClientConnection
          .secure(group: group)
          .withBackgroundActivityLogger(logger)
          .connect(host: "speech.googleapis.com", port: 443)

        // Specify call options to be used for gRPC calls
        let callOptions = CallOptions(customMetadata: [
          "x-goog-api-key": Constants.apiKey,
        ], logger: logger)

        
        let client = Cosmos_Auth_V1beta1_QueryClient(channel: channel, defaultCallOptions: callOptions)
        var req = Cosmos_Auth_V1beta1_QueryAccountRequest()
        req.address = "iaa1zfcupugp2j2fuhc65nagu4laetfuft3vwzmk2e"
    
        let res = client.account(req).response
        res.always { result in
            print("============")
        }
        

        
        let auth = Cosmos_Auth_V1beta1_BaseAccount()
        auth.address
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

struct Constants {
  static let sampleRate: Double = 16000

  #warning(
    "Please enter your API key below. Please refer to the README.md for instructions on how to configure the project."
  )
  static let apiKey = ""
}

