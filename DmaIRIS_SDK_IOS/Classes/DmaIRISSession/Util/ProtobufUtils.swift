//
//  ProtobufUtils.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/16.
//

import Foundation

public class ProtobufUtils {
    
//    public static org.uptickprotocol.irisnet.entity.Tx deserializeTx(String code) throws ServiceException {

    public static func deserializeTx(code: String) -> Tx {

        let txResult = Tx()

        if code.isEmpty {
            print("tx can not be empty")
            return txResult
        }
        
        let txData = Data(base64Encoded: code)!
        let txObj = try? TxTx(serializedData: txData)
        
        if txObj?.body != nil && txObj?.body.messages != nil {
            let txBody = txObj?.body
            
            let body = Body()
            body.memo = txBody?.memo ?? ""
            body.timeoutHeight = txBody?.timeoutHeight ?? 0
            
            if let txBodyMessages = txBody?.messages {
                for msg in txBodyMessages {
                    if let message = unpackMsg(typeUrl: msg.typeURL, value: msg.value) {
                        body.messages.append(message)
                    }
                }
            }
            txResult.body = body
        }
        
        if txObj?.authInfo != nil {

            let authInfo = txObj?.authInfo
            
            let ai = AuthInfo()
            
            let fee = authInfo?.fee
            let amount = parseCoins(coinList: fee?.amount ?? [])
            let feeDto = FeeDto()
            feeDto.amountList = amount
            feeDto.gasLimit = fee?.gasLimit
            feeDto.granter = fee?.granter
            feeDto.payer = fee?.payer
            ai.feeDto = feeDto
            
            var signerInfosList = [SignerInfo]()
            let signerInfos = authInfo?.signerInfos ?? []
            for signerInfo in signerInfos {
                let sign = SignerInfo()
                let any = signerInfo.publicKey
                
                let modeInfo = signerInfo.modeInfo
                let sequence = signerInfo.sequence
                
                let KeysPubKey = try? PubKey(serializedData: any.value)
                let pubKeyValue = KeysPubKey?.key.base64EncodedString() ?? ""
                
                let type = any.typeURL ?? ""
                let publicKey = PublicKey(type: type, value: pubKeyValue)
                sign.publicKey = publicKey
                
                sign.modeInfo = ModeInfo(single: Single(mode: modeInfo.single.mode.rawValue))
                sign.sequence = sequence
                signerInfosList.append(sign)
            }
            
            ai.signerInfosList = signerInfosList
            txResult.authInfo = ai
        }
        
        if txObj?.signatures != nil {
            var signaturesList = [String]()
            
            txObj?.signatures.forEach({ bytes in
                let bytesString = bytes.base64EncodedString()
                signaturesList.append(bytesString)
            })
            txResult.signaturesList = signaturesList
        }
        return txResult

    }
        
    public static func unpackMsg(typeUrl: String, value: Data) -> IrisMessage? {
        if typeUrl.isEmpty || value == nil { return nil }
        
        var txTypeString = typeUrl.replacingOccurrences(of: "/", with: "")
        let txType = TxType(rawValue: txTypeString)
        
        print(txType)
        
        switch txType {
        case .msgSend:
            if let message = try? BankMsgSend(serializedData: value) {
                let msg = MsgSend()
                msg.type = typeUrl
                msg.fromAddress = message.fromAddress
                msg.toAddress = message.toAddress
                
                for coin in message.amount {
                    let msgCoin = Coin()
                    msgCoin.denom = coin.denom
                    msgCoin.amount = coin.amount
                    msg.amount.append(msgCoin)
                }
                return msg
            }
         
            break
        default:
            break
        }
        
        return nil
    }
    
    
    public static func parseCoins(coinList: [BaseCoin]) -> [Coin] {
        
        var amount = [Coin]()
        for coin in coinList {
            let coinDto = Coin()
            coinDto.amount = coin.amount
            coinDto.denom = coin.denom
            amount.append(coinDto)
        }
        return amount
    }
}
