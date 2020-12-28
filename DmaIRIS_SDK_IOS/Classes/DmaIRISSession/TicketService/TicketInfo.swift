//
//  TicketInfo.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/15.
//

import Foundation
import HandyJSON

public class TicketInfo: HandyJSON {
    
    required public init() {
        
    }

    
    public var price: String = ""
    public var denom: String = ""
    public var nftTokeId: String = ""
    public var name: String = ""//名称
    public var imgUrl: String = ""//封面图片
    public var location: String = "" //位置
    public var introduction: String = "" //内容介绍
    public var startTime: Int64 = 0//开始日期
    public var endTime: Int64 = 0//结束日期
    public var date: Int64 = 0//日期
    public var par: String = ""//票档
    public var session: String = ""//场次
    public var isValid: Bool = false
    
    public func getValid() -> Bool {
        return self.isValid
    }
}
