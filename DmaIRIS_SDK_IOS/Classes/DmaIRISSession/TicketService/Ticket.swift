//
//  Ticket.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/15.
//

import Foundation
import HandyJSON

public class Ticket {
    var name: String = ""
    var id: String = ""
    var create: String = "" //发送者
    var ticketInfos: [TicketInfo]?
}
