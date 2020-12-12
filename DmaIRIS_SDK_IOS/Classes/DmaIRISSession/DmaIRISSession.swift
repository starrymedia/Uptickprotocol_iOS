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

//let host = "http://52.81.146.252:9090"
open class DmaIRISSession {

    public static let `default` = DmaIRISSession()
    
    let host: String? = nil
    let port: Int? = nil
    let channel: ClientConnection = {
        let host = "34.80.22.255"
        let port = 9090
        let group = PlatformSupport.makeEventLoopGroup(loopCount: 1)
        let channel = ClientConnection.insecure(group: group)
            .connect(host: host, port: port)
        return channel
    }()

    //MARK:- init
    init() {}

}



