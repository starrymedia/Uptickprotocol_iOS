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
        IRISServive.chainId = "bifrost-1"
        MerchantService.nodeUrl = "http://52.81.146.252:8091"
        RpcService.rpcUrl = "http://34.80.22.255:26657"
        
  
        let address = "iaa1fu5xru6umtfqthe588z6zk37gdknulr55ee5qf"
        let privateKey = "0f6f503144fd27a530f0ed5867fc19aae3a86bd41a021ddffd065519bbf11fed"
        let ticker = Ticket()
        ticker.create = address
        ticker.name = "wodeceshi12345678"
        ticker.id = "wodeceshi12345678"
        
        let ticketInfo = TicketInfo()
//         TickerService.mintTicket(ticketEntities: [ticketInfo],
//                                 sender: address,
//                                 recipient: address,
//                                 privateKey: privateKey,
//                                 isSign: false) { result in
//            print(result)
//        } errorCallback: { error in
//            print(error)
//        }

        //创建分类
//        TickerService.issueTicket(ticket: ticker, privateKey: privateKey) { result in
//            print(result)
//        } errorCallback: { error in
//            print(error)
//        }

        //查询详情
//        TickerService.ticketInfo(nftId: "ceshi09876",
//                                 tokenId: "starry0f4d7ca1794e409b946a9569f6721668") { result in
//            print(result)
//        } errorCallback: { error in
//            print(error)
//        }
        
//        获取所有票
//        TicketService.ticket(nftId: "ceshi09876") { ticket in
//            print(ticket)
//        } errorCallback: { error in
//            print(error)
//        }
      
        
        
        let date = self.getDateInTimer(timer: Date().timeIntervalSince1970)
        let lateDate = self.getDateInTimer(timer: Date().timeIntervalSince1970 + 24*60*60)
        print(date)
        print(lateDate)

     }
    
    func getDateInTimer(timer : Double) -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(timer))
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        return format.string(from: date)
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


