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


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mnemonic="little vibrant order rebel buddy decide notable pistol save pretty basic uncover opera split ancient surround ball iron sport eager onion lawn inch obvious"
        let from="iaa1fu5xru6umtfqthe588z6zk37gdknulr55ee5qf"
        let to = "iaa1nhu8qvj232mwxllwwxs4m9zz5pqcxazpmxtm8z";
        let value="10000";
        let privateKey="0f6f503144fd27a530f0ed5867fc19aae3a86bd41a021ddffd065519bbf11fed";
        let RpcURI = "http://34.80.22.255:26657"


        IRISServive.host = "34.80.22.255"
        IRISServive.port = 9090
        IRISServive.chainId = "bifrost-1"
        MerchantService.nodeUrl = "http://52.81.146.252:8091"
        BroadcastService.rpcUrl = "http://34.80.22.255:26657"


//        MerchantSession.getAllAsset { value in
//            print(value)
//        }
        

//        NFTService.transfer(from: from,
//                  to: to,
//                  value: "100",
//                  denom: "ubif",
//                  privateKey: privateKey) { res in
//
//
//            print("res=====\(res)")
//            } errorCallBack:{_ in
//
//            }
        
//        IRISSession.queryBalance(address: from, denom: "ubif") { cion in
//            print("cion:\(cion)")
////            37809011
////            43809011
////            45809011
//        } errorCallback: { error in
//            print(error)
//        }
//        
//        IRISSession.queryBalance(address: from, denom: "ubif") { cion in
//            print("cion:\(cion)")
////            37809011
////            43809011
////            45809011
//        } errorCallback: { error in
//            print(error)
//        }
//        MerchantSession.getTokensByAddress(address: address,
//                                           denom: model.address ?? "") { datas in
//         } errorCallback: { error in
//
//         }
        //        MerchantSession.onsale(denom: "vttt",
//                               tokenids: "starry7e1f1e96c9d34b5da73f32b9f31cd0f9",
//                               price: "1",
//                               coin: "ubif",
//                               privateKey: "cd8daa6b1daca451576a96b691c9f2c334221146e4901d20b242100e62e9eaf9")
//        { values in
//            print(values)
//        } errorCallback: { error in
//            print(error)
//        }
//
        
//        IRIS.transferNFT(sender: from,
//                         recipient: to,
//                         denom: "csj",
//                         tokenIds: "starry081bfeb441f942dbbacea978ab7d336c",
//                         chainId: "testing",
//                         broadcastUrl: RpcURI,
//                         privateKey: "cd8daa6b1daca451576a96b691c9f2c334221146e4901d20b242100e62e9eaf9"){ value in
//            print(value)
//        } errorCallback: { error in
//            print(error)
//        }

        
    

        
//        iaa1l5vst8vayx08aw85uy8j3hpngs7cwluen2gym5
//        MerchantSession.transfer(denom: "gcjnhh",
//                                 tokenIds: ["starry92fa66a4e6a04a89a39532db4d1fac88"],
//                                 privateKey: "cd8daa6b1daca451576a96b691c9f2c334221146e4901d20b242100e62e9eaf9") { values in
//            print(values)
//        } errorCallback: { error in
//            print(error)
//        }
////
//        iaa1ufnjelwg276r2xjj7cvs7le5esca59tmtcl7ve
//        IRIS.queryOwner(address: to, denom: "") { value in
//            print(value)
//
//            var tokenIds = [String]()
//            for collection in value.idCollections {
//                tokenIds.append(contentsOf: collection.ids)
//            }
//            print(tokenIds)
//        }
        

//        MerchantSession.getAssetByDenom(denom: "ces11") { value in
//            print(value)
//        }
//
//
//        IRIS.mintNFTMuch(sender: from,
//                         recipient: from,
//                         name: "fantest111111",
//                         data: "",
//                         denom: "fantestqq1111",
//                         uri: "",
//                         tokenIds: ["fadfadfsadfsadf","fsdfsadfdsfasdfdfdsf"],
//                         chainId: "testing",
//                         broadcastUrl: RpcURI,
//                         privateKey: privateKey) { string in
//
//                        print(string)
//                    } errorCallback: { error in
//                        print(error)
//                    }
 
//        IRIS.issueDenom(sender: from,
//                        name:"fantest111111",
//                        schema: "fantest111111",
//                        id: "fantestqq1111",
//                        chainId: "testing",
//                        privateKey: privateKey,
//                        broadcastUrl: RpcURI) { string in
//
//            print(string)
//        } errorCallback: { error in
//            print(error)
//        }
//        let str1 = WalletManager.exportAddressAndPrivateKeyFromMnemonics(mnemonics: mnemonic)
//        let str2 = WalletManager.exportBech32Address(privateKey: privateKey)
//        print(str1.privateKey)
//        print(str1.address)
//        print(str2)
        
//        IRIS.queryTokens(denom: "ces6") { nftDenom in
//            print(nftDenom)
//        }
        
//        IRIS.queryDenoms { denoms in
//            print(denoms)
//
//
//        }
        
//
////





        
        
        
//        let mnemonics = "avoid insect cushion electric plunge hockey great able dice marriage winter way major path holiday basket topple property exit lottery regular awesome replace outer"
//        let address = EthWallet.exportBech32Address(mnemonics: mnemonics)
//        print(address)
        
        //b1fd3119cd4fe92d05640fa054fd904e3cedc3e19760c89f1cda1d52d5d7ff24
                

//
//

        
        
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


