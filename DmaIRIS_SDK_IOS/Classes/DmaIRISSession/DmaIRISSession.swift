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

public let IRIS = DmaIRISSession.default
//        self.host = "34.80.22.255"
//        self.port = 9090
//let host = "http://52.81.146.252:9090"
open class DmaIRISSession {

    public static let `default` = DmaIRISSession()
    
    open var host = ""
    open var port = 0

    //MARK:- init
    init() { }
    
    lazy var channel: ClientConnection = {
        let group = PlatformSupport.makeEventLoopGroup(loopCount: 1)
        let channel = ClientConnection.insecure(group: group)
            .connect(host: self.host, port: self.port)
        return channel
    }()


}



