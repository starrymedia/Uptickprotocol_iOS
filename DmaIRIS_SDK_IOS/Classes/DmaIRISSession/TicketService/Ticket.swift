//
//  Ticket.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/15.
//

import Foundation
import HandyJSON

public class Ticket {
    public var name: String = ""
    public var id: String = ""
    public var create: String = "" //发送者
    public var ticketInfos =  [TicketInfo]()
    
    required public init() {
        
    }
}
