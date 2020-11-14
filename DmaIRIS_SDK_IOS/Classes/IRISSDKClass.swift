//
//  IRISSDKClass.swift
//  IRISSDK
//
//  Created by StarryMedia on 2020/11/11.
//

import Foundation
import Alamofire

open class IRISSDKClass: NSObject {
    open func textSDK() {
        print("test")
        AF.request("https://httpbin.org/get").response { response in
            debugPrint(response)
        }
    }
}
