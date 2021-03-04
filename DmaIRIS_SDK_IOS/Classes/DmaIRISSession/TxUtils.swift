//
//  TxUtils.swift
//  DmaIRIS_SDK_IOS
//
//  Created by StarryMedia on 2020/11/19.
//

import Foundation
import SwiftProtobuf

public let txGasLimit:UInt64 = 200000
public let txAmount = "1"
public let txDenom = IRISServive.defaultCoin

open class TxUtils {
   
    class func getFee(gasLimit: UInt64, amount: String, denom: String) -> TxFee {
        //设置交易费
        var feeCoin = BaseCoin()
        feeCoin.amount = amount
        feeCoin.denom = denom
        
        var fee = TxFee()
        fee.gasLimit = gasLimit
        fee.amount.append(feeCoin)

        return fee
    }
    
    class func getBody(meno: String, timeoutHeight: UInt64) -> TxBody {
        
        var body = TxBody()
        body.memo = meno
        body.timeoutHeight = timeoutHeight
        return body
    }
    
    class func getProtobufAny(message: Message, typePrefix: String) -> ProtobufAny? {
        guard let protobufAny = try? ProtobufAny(message: message,typePrefix: "") else {
            return nil
        }
        return protobufAny
    }
    
    
    public static var identifier: String {

        var string = ""
        let uuidRef = CFUUIDCreate(nil)
        let uuidStringRef = CFUUIDCreateString(nil,uuidRef)
        string = uuidStringRef as! String
        string = string.replacingOccurrences(of: "-", with: "")
        
        return string.lowercased()
    }
    

    
    public class func fromBech32(_ address: String) -> Data? {
        if let data = try? Bech32Utils.fromBech32(address: address) {
            if let bytesValue = try? BytesValue(data) {
                return bytesValue.value
            }
        }
        return nil
    }
    
  
}
