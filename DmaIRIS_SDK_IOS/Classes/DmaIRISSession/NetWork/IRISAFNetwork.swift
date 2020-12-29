//
//  IRISAFNetwork.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/14.
//

import Foundation
import Alamofire

public let IRISAF = IRISAFNetwork.default

open class IRISAFNetwork {
    
    public static let `default` = IRISAFNetwork()


    open func postRequest<Parameters: Encodable>(url: String,
                                             parameters: Parameters,
                                             successCallback: @escaping (_ jsonString: String) -> (),
                                             errorCallBack: @escaping FPErrorCallback) {
        
        assert(url != "","url is empty")
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoder: JSONParameterEncoder.default).responseString { response in
                    switch response.result {
                    case .success(let jsonString):
                        successCallback(jsonString)
                    case .failure(let error):
                        errorCallBack(error.localizedDescription)
                    }
        }
    }
    
    open func getRequest(url: String,
                         successCallback: @escaping (_ jsonString: String) -> (),
                         errorCallBack: @escaping FPErrorCallback) {
        assert(url != "","url is empty")
        AF.request(url).responseString { response in
            switch response.result {
            case .success(let jsonString):
                successCallback(jsonString)
            case .failure(let error):
                errorCallBack(error.localizedDescription)
            }
        }
    }
}
