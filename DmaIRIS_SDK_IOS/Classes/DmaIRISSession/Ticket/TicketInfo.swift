//
//  TicketInfo.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/15.
//

import Foundation

public class TicketInfo {

    var nftId: String = ""
    var nftTokeId: String = ""
    var name: String = ""//名称
    var imgUrl: String = ""//封面图片
    var location: String = "" //位置
    var introduction: String = "" //内容介绍
    var startTime: Int64 = 0//开始日期
    var endTime: Int64 = 0//结束日期
    var data: Int64 = 0//日期
    var par: String = ""//票档
    var session: String = ""//场次
    var isValid: Bool? = nil
}
