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
public let txDenom = "ubif"

open class TxUtils {
   
    class func getFee(gasLimit: UInt64, amount: String, denom: String) -> TxFee {
        //设置交易费
        var feeCoin = Coin()
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
    
    public class func toWei(tokenSymblol: String,
                            amount: Double,
                            successCallback: @escaping (_ amount: String) -> (),
                            errorCallBack: @escaping FPErrorCallback) {
     
        IRIS.token(denom: tokenSymblol) { scale in
            print(scale)
            var amount = Decimal(amount)
            var result = Decimal()
            NSDecimalMultiplyByPowerOf10(&result, &amount, Int16(scale), .plain)

            var rounded = Decimal()
            NSDecimalRound(&rounded, &result, 0, .down)
            let resultstring = NSDecimalString(&rounded, nil)
           
            successCallback(resultstring)

        } errorCallBack: { error in
            print(error)
            errorCallBack(error)
        }
    }
    
    public class func forWei(tokenSymblol: String,
                            amount: UInt64,
                            successCallback: @escaping (_ amount: String) -> (),
                            errorCallBack: @escaping FPErrorCallback) {
     
        IRIS.token(denom: tokenSymblol) { scale in
            print(scale)
            var amount = Decimal(amount)
            var result = Decimal()
            NSDecimalMultiplyByPowerOf10(&result, &amount, -Int16(scale), .plain)
            let resultstring = NSDecimalString(&result, nil)
            successCallback(resultstring)
        } errorCallBack: { error in
            print(error)
            errorCallBack(error)
        }
    }
    
  
}
