//
//  SignerInfo.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/16.
//

import Foundation
import HandyJSON

public class SignerInfo: HandyJSON  {

    required public init() {
        
    }

    public var publicKey: PublicKey?
    public var modeInfo: ModeInfo?
    public var sequence: UInt64?

}
