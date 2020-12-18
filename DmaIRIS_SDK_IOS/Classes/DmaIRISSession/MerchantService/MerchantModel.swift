//
//  MerchantModel.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/14.
//

import Foundation
import HandyJSON

struct AllAssetModel: HandyJSON {
    var code: Int?
    var data: [String]?
    var msg: String?
    var success: Bool = true
}

public struct AssetModel: HandyJSON {
    public init() {}
    var code: Int?
    var data: AssetDenom?
    var msg: String?
    var success: Bool?
}

public struct AssetDenom: HandyJSON {
    public init() {}
    var denom: String?
    var tokens: [AssetDenomToken]?
}

struct AssetDenomToken: HandyJSON {
    var owner: String?
    var tokenid: String?
    var assetDenom: String?
    var price: String?
    var time: String?
    var coin: String?
 }

public struct TokenModel: HandyJSON {
    public init() {}
    var code: Int?
    var data: TokenDataModel?
    var msg: String?
    var success: Bool?
}

public struct TokenDataModel: HandyJSON {
    public init() {}
    var assetDenom: String?
    public var tokenId: String?
    var owner: String?
    var price: String?
    var coin: String?
    var time: String?
}

public struct TokensModel: HandyJSON {
    public init() {}
    var code: Int?
    var data: [TokenDataModel]?
    var msg: String?
    var success: Bool = true
}


struct MerchantTransfer: Encodable {
    
    let payerPubKey: String
    let nftTd: String
    let payer: String
    let recipien: String
    var signatures: String?
    let ids: [String]
    var memo: String
}

public struct MerchantResponseModel: HandyJSON {
    public init() {}
    public var code: Int?
    public var success: Bool?
    public var msg: String?
    public var data: Any?
}
 

struct MerchantOnSale: Encodable {
    
    let pubKey: String
    let nftId: String
    let owner: String
    var signatures: String?
    var labels: [MerchantOnSaleLabels]?
}
 
struct MerchantOnSaleLabels: Encodable {
    let coin: String
    let tokenId: String
    let price: String
}

struct MerchantOffSale: Encodable {
    
    let pubKey: String
    let nftId: String
    let owner: String
    var tokenIds: [String]?
}
 
