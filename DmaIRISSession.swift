//
//  DmaIRISSession.swift
//  DmaIRIS_SDK_IOS
//
//  Created by StarryMedia on 2020/11/17.
//

import UIKit
import SwiftProtobuf
import GRPC
import NIO
import Alamofire

public let IRIS = DmaIRISSession.default

open class DmaIRISSession {

    public static let `default` = DmaIRISSession()
    
    let host: String? = nil
    let port: Int? = nil
    let channel: ClientConnection = {
        let host = "192.168.1.112"
        let port = 9090
        let group = PlatformSupport.makeEventLoopGroup(loopCount: 1)
        let channel = ClientConnection.insecure(group: group)
            .connect(host: host, port: port)
        return channel
    }()
    
    //MARK:- Auth
    public func queryAccount(address: String,_ callback: @escaping (_ address: String, _ sequence: UInt64, _ accountNumber: UInt64) -> Void) {
        
        let client = Cosmos_Auth_V1beta1_QueryClient(channel: self.channel)
        var req = Cosmos_Auth_V1beta1_QueryAccountRequest()
        req.address = address

        let res = client.account(req)
        res.response.whenComplete { result in
            switch result {
            case .success(let response):
                print(response.account.value)
                if let baseAccount = try? Cosmos_Auth_V1beta1_BaseAccount(serializedData: response.account.value) {
                    callback(baseAccount.address,
                             baseAccount.sequence,
                             baseAccount.accountNumber)
                }
            case .failure(let error):
                print(error)
            }
        }
     }
    
    //MARK:- Bankmok
    public func queryBalance(address: String, denom: String,_ callback: @escaping (_ amount: String, _ denom: String) -> Void) {
                
        let client = Cosmos_Bank_V1beta1_QueryClient(channel: self.channel)
        var req = Cosmos_Bank_V1beta1_QueryBalanceRequest()
        req.address = address
        req.denom = denom
        let res = client.balance(req)
        res.response.whenComplete { result in
            switch result {
            case .success(let value):
                callback(value.balance.amount,value.balance.denom)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    public func queryAllBalance(address: String, _ callback: @escaping (_ list: [IRISSBalanceMode] ) -> Void) {
                
        let client = Cosmos_Bank_V1beta1_QueryClient(channel: self.channel)
        var req = Cosmos_Bank_V1beta1_QueryAllBalancesRequest()
        req.address = address
        let res = client.allBalances(req)
        res.response.whenComplete { result in
            switch result {
            case .success(let value):
                var balanceModels = [IRISSBalanceMode]()
                for  balance in value.balances {
                    let balanceModel = IRISSBalanceMode(amount: balance.amount, denom: balance.denom)
                    balanceModels.append(balanceModel)
                }
                callback(balanceModels)
            case .failure(let error):
                print(error)
            }
        }
    }

    public func queryTotalSupply(_ callback: @escaping (_ list: [IRISSBalanceMode] ) -> Void) {
                
        let client = Cosmos_Bank_V1beta1_QueryClient(channel: self.channel)
        let req = Cosmos_Bank_V1beta1_QueryTotalSupplyRequest()

        let res = client.totalSupply(req)
        res.response.whenComplete { result in
            switch result {
            case .success(let value):
                var balanceModels = [IRISSBalanceMode]()
                for  supply in value.supply {
                    let balanceModel = IRISSBalanceMode(amount: supply.amount, denom: supply.denom)
                    balanceModels.append(balanceModel)
                }
                callback(balanceModels)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    public func querySupplyOf(denom: String, _ callback: @escaping (_ amount: String, _ denom: String) -> Void) {
                
        let client = Cosmos_Bank_V1beta1_QueryClient(channel: self.channel)
        var req = Cosmos_Bank_V1beta1_QuerySupplyOfRequest()
        req.denom = denom
        let res = client.supplyOf(req)
        res.response.whenComplete { result in
            switch result {
            case .success(let value):
                callback(value.amount.amount, value.amount.denom)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK:- transfer
    public func transfer(from: String,
                         to: String,
                         value: String,
                         denom: String,
                         mnemonics: String,
                         chainId: String) {
        
        var coin = Cosmos_Base_V1beta1_Coin()
        coin.amount = value
        coin.denom = denom
        
        var msgSend = Cosmos_Bank_V1beta1_MsgSend()
        msgSend.fromAddress = from
        msgSend.toAddress = to
        msgSend.amount = [coin]
    
        var body = Cosmos_Tx_V1beta1_TxBody()
        guard let any = try? Google_Protobuf_Any.init(message: msgSend,typePrefix: "") else { return }
        body.messages.append(any)
        body.memo = ""
        body.timeoutHeight = 0
        
        var fee = Cosmos_Tx_V1beta1_Fee()
        fee.gasLimit = 200000
        var feeCoin = Cosmos_Base_V1beta1_Coin()
        feeCoin.amount = "1"
        feeCoin.denom = "uiris"
        fee.amount.append(feeCoin)
        
        //调用签名方法
        signTx(txBody: body, fee: fee, chainId: chainId, mnemonics: mnemonics) { tx in
            print("tx:\(tx)")
        }
    }
    

    //MARK:- init
    init() {
        
    }

}

//MARK:- TxService
extension DmaIRISSession {
    
    func signTx(txBody: Cosmos_Tx_V1beta1_TxBody,
                fee: Cosmos_Tx_V1beta1_Fee,
                chainId: String,
                mnemonics: String,
                _ callback: @escaping (_ tx: Cosmos_Tx_V1beta1_Tx) -> Void) {

        //获取地址
        let publicKeyData = try? EthWallet.exportPublicKey(mnemonics)
        let address = EthWallet.exportBech32Address(mnemonics: mnemonics)
        IRIS.queryAccount(address: address) { (address, sequence, accountNumber) in
            print("address:\(address)")
            print("sequence:\(sequence)")
            print("accountNumber:\(accountNumber)")
            
            //公钥
            var publicKeyMsg = Cosmos_Crypto_Secp256k1_PubKey()
            publicKeyMsg.key = publicKeyData!!
            let any = try? Google_Protobuf_Any(message: publicKeyMsg,typePrefix: "")
           
            //类型
            var modeInfo = Cosmos_Tx_V1beta1_ModeInfo()
            var sign = Cosmos_Tx_V1beta1_ModeInfo.Single()
            sign.mode = .direct
            modeInfo.single = sign

            //配置签名信息
            var signerInfo = Cosmos_Tx_V1beta1_SignerInfo()
            signerInfo.publicKey = any!
            signerInfo.sequence = sequence
            
            //认证信息
            var ai = Cosmos_Tx_V1beta1_AuthInfo()
            //签名信息
            ai.signerInfos.append(signerInfo)
            //交易费
            ai.fee = fee
            //链ID
            let chainId = chainId
            if chainId.isEmpty {
                print("chainId ie empty")
            }
            //签名实体
            var signdoc = Cosmos_Tx_V1beta1_SignDoc()
            //交易体
            signdoc.bodyBytes = try! txBody.serializedData()
            //认证信息
            signdoc.authInfoBytes = try! txBody.serializedData()
            //地址编号
            signdoc.accountNumber = accountNumber
            //链ID
            signdoc.chainID = chainId
            
            
            //签名算法
            let hash = try? signdoc.serializedData().sha256()
            let signResult = EthWallet.signatureString(signDoc: (hash?.base64EncodedString())!, mnemonics: mnemonics)
                        
            var txSign = Cosmos_Tx_V1beta1_Tx()
            txSign.body = txBody
            txSign.authInfo = ai
            txSign.signatures.append(Data(base64Encoded: signResult!)!)
            
            print("txSign:\(txSign)")

        }

    }
    
    func broadcast(url: String,tx: String) {
        
       
       
        let broadcast = BroadcastRequest(id: "service_client",
                                     jsonrpc: "2.0",
                                     method: "broadcast_tx_commit",
                                     params: BroadcastRequestParams(tx: tx))

        AF.request(url,
                   method: .post,
                   parameters: broadcast,
                   encoder: JSONParameterEncoder.default).response { response in
            debugPrint(response)
                    
        }
    }
    
}

struct BroadcastRequest: Encodable {
    let id: String
    let jsonrpc: String
    let method: String
    let params: BroadcastRequestParams

}

struct BroadcastRequestParams: Encodable {
    let tx: String
}


extension DmaIRISSession {
    public struct IRISSBalanceMode {
        var amount: String?
        var denom: String?
    }
}
