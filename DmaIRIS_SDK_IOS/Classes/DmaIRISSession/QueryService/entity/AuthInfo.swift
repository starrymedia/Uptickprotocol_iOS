//
//  AuthInfo.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/16.
//

import Foundation
import HandyJSON
public class AuthInfo: HandyJSON  {

    required public init() {
        
    }
    public var feeDto =  FeeDto()
    public var signerInfosList = [SignerInfo]()

}
