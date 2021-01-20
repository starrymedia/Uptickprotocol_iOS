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
    public var denom: String = ""//分类ID
    public var nftTokeId: String = ""// 资产tokenID
    public var name: String = ""//资产名称
    public var imgUrl: String = ""//资产封面图片（大图）
    public var iconUrl: String = ""//资产图标（小图）
    public var backgroundColor: String = "" //资产可视展示时的底色（例如票的背景颜色）
    public var location: String = "" //位置
    public var description: String = "" //内容介绍
    public var startTime: Int64 = 0//开始日期
    public var endTime: Int64 = 0//结束日期
    public var date: Int64 = 0//日期
    public var par: String = ""//票档
    public var session: String = ""//场次
    public var isValid: Bool = false
    
    //资产发行平台及发行方属性
    public var minter: String = "" //铸造资产平台名称（例如 Uptick Ticket）
    public var minterLogoUrl: String = "" //铸造者的Logo图片
    public var issuerName: String = "" //资产发布方名称
    public var issuerAddr: String = "" // 资产发布方唯一地址
    public var issuerLogoUrl: String = "" //资产发布方的Logo图片
    public var extended: String = "" //扩展属性

    public func getValid() -> Bool {
        return self.isValid
    }
}


public class CardInfo: TicketInfo {
    
    public var number: Int?
}
