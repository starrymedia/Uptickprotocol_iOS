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
        
//        var uuid = UIDevice.current.identifierForVendor?.uuidString ?? ""
//        var array = uuid.split(separator: "-")
//        string += array.last ?? ""
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "HHmmssSSS"
//        string.append(dateFormatter.string(from: NSDate() as Date))
        let uuidRef = CFUUIDCreate(nil)
        let uuidStringRef = CFUUIDCreateString(nil,uuidRef)
        string = uuidStringRef as! String
        string = string.replacingOccurrences(of: "-", with: "")
//        let random = arc4random_uniform(UInt32(64 - string.count - 6))
//        let str = "\(random)"
//        print("random\(str)")
//        string += str
        
        
        
        return string.lowercased()
    }
    
    public class func toWei(tokenSymblol: String,
                            amount: Double,
                            successCallback: @escaping (_ amount: UInt64) -> (),
                            errorCallBack: @escaping FPErrorCallback) {
     
        IRIS.token(denom: tokenSymblol) { scale in
            print(scale)
            var amount = Decimal(amount)
            var result = Decimal()
            NSDecimalMultiplyByPowerOf10(&result, &amount, Int16(scale), .plain)

            var rounded = Decimal()
            NSDecimalRound(&rounded, &result, 0, .down)
            let resultstring = NSDecimalString(&rounded, nil)
            if let decimalToInt = UInt64(resultstring) {
                successCallback(decimalToInt)
            } else {
                errorCallBack("error")
            }
        } errorCallBack: { error in
            print(error)
            errorCallBack(error)
        }
    }
    
    public class func forWei(tokenSymblol: String,
                            amount: UInt64,
                            successCallback: @escaping (_ amount: Double) -> (),
                            errorCallBack: @escaping FPErrorCallback) {
     
        IRIS.token(denom: tokenSymblol) { scale in
            print(scale)
            var amount = Decimal(amount)
            var result = Decimal()
            NSDecimalMultiplyByPowerOf10(&result, &amount, -Int16(scale), .plain)
            let resultstring = NSDecimalString(&result, nil)
            if let decimalToDouble = Double(resultstring) {
                successCallback(decimalToDouble)
            } else {
                errorCallBack("error")
            }
        } errorCallBack: { error in
            print(error)
            errorCallBack(error)
        }
    }
    
  
}
