//
//  Schema.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/15.
//

import Foundation

public enum Schema: String {
    case ticket = "/uptick.ticket"
    case activity = "/uptick.activity"
    case coupon = "/uptick.coupon"
    case souvenirCard = "/uptick.souvenirCard"
    case VIPCard = "/uptick.VIPCard"
}

extension Schema {
    public func toJSONString() -> String {
        
        let result = "{\"type\":\"\(self.rawValue)\"}"
        return result
    }
    
    func getJSONValue(_ jsonString: String) -> String {
        if let jsonData = jsonString.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            if let json = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) {
                let dict = json as? [String : Any]
                let value = dict?["type"] as? String ?? "json error"
                return value
            }
        }
        return "json error"
    }
    
    public func isEqualTo(_ jsonString: String) -> Bool {
        
        let value = self.getJSONValue(jsonString)
        if value == self.rawValue {
            return true
        }
        return false
    }
}
