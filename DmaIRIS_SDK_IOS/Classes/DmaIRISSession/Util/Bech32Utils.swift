//
//  Bech32Utils.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/15.
//

import Foundation
import secp256k1_swift
import web3swift

public class Bech32Utils {

    public static func toBech32(hrp: String, pubkeyHexData: Data) -> String {

        let bits = AddressUtils.convertBits(hash: pubkeyHexData, instart: 0, from: 8, to: 5, pad: true)
        let str = Bech32().encode(AddressUtils.HRP, values: bits)
        return str
    }
    
    public static func fromBech32(address: String) -> Data {
        if let data = try? Bech32().decode(address).checksum {
            let bits = AddressUtils.convertBits(hash: data, instart: 0, from: 5, to: 8, pad: true)
            return bits
        }
        return Data()
    }
 
}
