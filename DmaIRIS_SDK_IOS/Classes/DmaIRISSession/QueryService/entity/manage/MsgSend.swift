//
//  MsgSend.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/16.
//

import Foundation
public class MsgSend: IrisMessage {

    public var fromAddress: String = ""
    public var toAddress: String = ""
    public var amount: [Coin] = []
}
