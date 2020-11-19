//
//  ECKeyPair.swift
//  DmaIRIS_SDK_IOS
//
//  Created by StarryMedia on 2020/11/17.
//

import UIKit
import web3swift
import BigInt

class ECKeyPair {
    
    func create(privateKey: String) {
        guard let keystoreV3 = try!EthereumKeystoreV3.init(privateKey: Data.fromHex(privateKey)!) else{ return }
        let keystoreManager = KeystoreManager.init([keystoreV3])
        

    }
    

}
