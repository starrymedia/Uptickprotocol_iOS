//
//  IRISSDKClass.swift
//  IRISSDK
//
//  Created by StarryMedia on 2020/11/11.
//

import Foundation
import Alamofire
import HandyJSON



open class IRISSDKClass: NSObject {
    open func textSDK() {
        print("test")
        AF.request("https://httpbin.org/get").response { response in
            debugPrint(response)
        }
    }
    

}

/**
   * 获取平台上架中的所有资产种类
   * @return
   */
//  public JsonResult<List<String>> allAsset() {
//      String url = nodeURI + allAsset;
//      Map<String, String> param = new HashMap<>();
//      String str = HttpClientUtil.getInstance().get(url, param);
//      return JSONObject.parseObject(str, JsonResult.class);
//  }
