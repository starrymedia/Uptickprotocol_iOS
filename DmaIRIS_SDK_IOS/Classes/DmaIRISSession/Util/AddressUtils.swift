//
//  AddressUtils.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/15.
//

import Foundation
import web3swift

public class AddressUtils {

    public static let HRP = "iaa"
    
    public static func convertBits(hash: Data, instart: Int, from: Int, to: Int, pad: Bool) -> Data {
        let data = try? SegwitAddrCoder().convertBits(instart: instart, from: from, to: to, pad: true, idata: hash)
        return data ?? Data()
    }
    
    public static func toBech32(pubkeyHex: Data) -> String {
        let bits = AddressUtils.convertBits(hash: pubkeyHex, instart: 0, from: 8, to: 5, pad: true)
        let str = Bech32().encode(AddressUtils.HRP, values: bits)
        return str
    }
    
    public static func toBech32(privateKey: String) -> String {
        guard let data = Data.fromHex(privateKey) else { return "" }
        guard let pubkeyHexData = Web3.Utils.privateToPublic(data, compressed: true) else { return "" }
        let hash = RIPEMD160.hash(message: (pubkeyHexData.sha256()))
        return toBech32(pubkeyHex: hash)
    }
}
