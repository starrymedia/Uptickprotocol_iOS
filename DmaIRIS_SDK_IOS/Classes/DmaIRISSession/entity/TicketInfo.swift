//
//  TicketInfo.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/15.
//

import Foundation

public class TicketInfo: BaseInfo {
    
    required public init() {
        
    }

    public var location: String = "" //位置
    public var startTime: Int64 = 0//开始日期
    public var endTime: Int64 = 0//结束日期
    public var date: Int64 = 0//日期
    public var par: String = ""//票档
    public var session: String = ""//场次
    public var isValid: Bool = false//是否可有效使用（是否已经被验证）
    public var price: String = ""//售价
    
    public func getValid() -> Bool {
        return self.isValid
    }
}
