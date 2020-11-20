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

open class DmaIRISSession {

    public static let `default` = DmaIRISSession()
    
    let host: String? = nil
    let port: Int? = nil
    let channel: ClientConnection = {
        let host = "192.168.1.112"
        let port = 9090
        let group = PlatformSupport.makeEventLoopGroup(loopCount: 1)
        let channel = ClientConnection.insecure(group: group)
            .connect(host: host, port: port)
        return channel
    }()

    //MARK:- Merchant模块

    /**
       * 获取平台上架中的所有资产种类
       * @return
       */
//      public JsonResult<List<String>> allAsset() {
//          String url = nodeURI + allAsset;
//          Map<String, String> param = new HashMap<>();
//          String str = HttpClientUtil.getInstance().get(url, param);
//          return JSONObject.parseObject(str, JsonResult.class);
//      }
//
    


    //MARK:- init
    init() {
        
    }

}



