//
//  DmaIRISSession.swift
//  DmaIRIS_SDK_IOS
//
//  Created by StarryMedia on 2020/11/17.
//

import UIKit
import SwiftProtobuf
import GRPC
import NIO
import Alamofire

public let IRISServive = DmaIRISSession.default

open class DmaIRISSession {

    public static let `default` = DmaIRISSession()
    
    open var host = ""
    open var port = 0
    open var chainId = ""
    //MARK:- init
    init() { }
    
    lazy var channel: ClientConnection = {
        let group = PlatformSupport.makeEventLoopGroup(loopCount: 1)
        assert(host != "","host is empty")
        assert(port != 0,"prot is empty")
        let channel = ClientConnection.insecure(group: group)
            .connect(host: self.host, port: self.port)
        return channel
    }()


}



