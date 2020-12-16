//
//  TokenService.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/15.
//

import Foundation

public let TokenService = TokenServiceSession.default

open class TokenServiceSession {
        
    public static let `default` = TokenServiceSession()
    
    
    /// 创建同质化Token
    /// - Parameters:
    ///   - initialSupply: 初始化数量
    ///   - maxSupply: 最大数量
    ///   - name: 名称
    ///   - symbol: 简称
    ///   - mintable: 是否可增发
    ///   - owner: token所有者钱包地址
    ///   - privateKey: 私钥
    public func issueToken(initialSupply: UInt64,
                           maxSupply: UInt64,
                           tokenName: String,
                           tokenSymbol: String,
                           mintAble: Bool,
                           owner: String,
                           privateKey: String,
                           successCallback: @escaping (_ res: BroadcastModel) -> (),
                           errorCallBack: @escaping FPErrorCallback) {
    
        var token = TokenMsgIssueToken()
        token.symbol = tokenSymbol
        token.initialSupply = initialSupply
        token.maxSupply = maxSupply
        token.mintable = true
        token.scale = 6
        token.name = tokenName
        token.minUnit = tokenSymbol
        token.mintable = mintAble
        
        if let ownerValue = TxUtils.fromBech32(owner) {
            token.owner = ownerValue
        }
        
        var txBody = TxUtils.getBody(meno: "", timeoutHeight: 0)
        if let any = TxUtils.getProtobufAny(message: token, typePrefix: "") {
            txBody.messages.append(any)
        }
        
        TxService.signTx(txBody: txBody, privateKey: privateKey) { tx in
            RpcService.broadcast(tx: tx) { broadcast in
                successCallback(broadcast)
            } errorCallBack: { error in
                errorCallBack(error)
            }
            
        }
    }
    
    /// 根据简称 增发同质化Token
    /// - Parameters:
    ///   - to: 地址
    ///   - symbol: 简称
    ///   - owner: token所有者钱包地址
    ///   - amount: 价格
    ///   - privateKey: 私钥
    public func mintToken(tokenSymbol: String,
                          amount: UInt64,
                          tokenOwner: String,
                          recipient: String,
                          privateKey: String,
                          successCallback: @escaping (_ res: BroadcastModel) -> (),
                          errorCallBack: @escaping FPErrorCallback) {
        
        
        var token = TokenMsgMintToken()
        token.symbol = tokenSymbol
        token.amount = amount
        if let ownerValue = TxUtils.fromBech32(tokenOwner) {
            token.owner = ownerValue
        }
        if let toValue = TxUtils.fromBech32(recipient) {
            token.to = toValue
        }
        
        var txBody = TxUtils.getBody(meno: "", timeoutHeight: 0)
        if let any = TxUtils.getProtobufAny(message: token, typePrefix: "") {
            txBody.messages.append(any)
        }
        
        let fee = TxUtils.getFee(gasLimit: txGasLimit, amount: txAmount, denom: txDenom)
        
        TxService.signTx(txBody: txBody, privateKey: privateKey) { tx in
            RpcService.broadcast(tx: tx) { broadcast in
                successCallback(broadcast)
            } errorCallBack: { error in
                errorCallBack(error)
            }
            
        }
    }
    
    /**
     * 更换同质化Token Owner
     *
     * @param tokenSymbol
     * @param tokenOwner
     * @param recipient
     * @param privateKey
     */
    public func transferOwnership(tokenSymbol: String,
                                  tokenOwner: String,
                                  recipient: String,
                                  privateKey: String,
                                  successCallback: @escaping (_ res: BroadcastModel) -> (),
                                  errorCallBack: @escaping FPErrorCallback) {

        var token = TokenMsgTransferTokenOwner()
        token.symbol = tokenSymbol
        if let fromValue = TxUtils.fromBech32(tokenOwner) {
            token.srcOwner = fromValue
        }
        if let toValue = TxUtils.fromBech32(recipient) {
            token.dstOwner = toValue
        }
        
        var txBody = TxUtils.getBody(meno: "", timeoutHeight: 0)
        if let any = TxUtils.getProtobufAny(message: token, typePrefix: "") {
            txBody.messages.append(any)
        }
        
        let fee = TxUtils.getFee(gasLimit: txGasLimit, amount: txAmount, denom: txDenom)
        
        TxService.signTx(txBody: txBody, privateKey: privateKey) { tx in
            RpcService.broadcast(tx: tx) { res in
                successCallback(res)
            } errorCallBack: { error in
                errorCallBack(error)
            }
            
        }
    }
    
    
    /**
     * 转送同质化token
     *
     * @param from
     * @param to
     * @param tokenSymbol
     * @param amount
     * @param privateKey
     */
    public func transfer(from: String,
                         to: String,
                         tokenSymbol: String,
                         amount: Decimal,
                         privateKey: String,
                         successCallback: @escaping (_ res: BroadcastModel) -> (),
                         errorCallBack: @escaping FPErrorCallback) {
        self.transfer(from: from,
                      to: to,
                      tokenSymbol: tokenSymbol,
                      amount: amount,
                      memo: "",
                      privateKey: privateKey,
                      successCallback: successCallback,
                      errorCallBack: errorCallBack)
    }
    /**
       * 转送同质化token
       * @param from
       * @param to
       * @param tokenSymbol
       * @param amount
       * @param privateKey
    */
    public func transfer(from: String,
                         to: String,
                         tokenSymbol: String,
                         amount: Decimal,
                         memo: String,
                         privateKey: String,
                         successCallback: @escaping (_ res: BroadcastModel) -> (),
                         errorCallBack: @escaping FPErrorCallback) {
        
        self.toWei(tokenSymblol: tokenSymbol,
                   amount: amount) { amount in
            self.sendTransfer(from: from,
                              to: to,
                              tokenSymbol: tokenSymbol,
                              amount: amount,
                              memo: memo,
                              privateKey: privateKey,
                              successCallback: successCallback,
                              errorCallBack: errorCallBack)
        } errorCallBack: { error in
            errorCallBack(error)
        }

       
    }
    
    func sendTransfer(from: String,
                      to: String,
                      tokenSymbol: String,
                      amount: String,
                      memo: String,
                      privateKey: String,
                      successCallback: @escaping (_ res: BroadcastModel) -> (),
                      errorCallBack: @escaping FPErrorCallback) {
        
        var coin = BaseCoin()
        coin.amount = amount
        coin.denom = tokenSymbol
        
        var msgSend = BankMsgSend()
        msgSend.fromAddress = from
        msgSend.toAddress = to
        msgSend.amount.append(coin)
        
        var txBody = TxUtils.getBody(meno: memo, timeoutHeight: 0)
        if let any = TxUtils.getProtobufAny(message: msgSend, typePrefix: "") {
            txBody.messages.append(any)
        }
        
        //调用签名方法
        TxService.signTx(txBody: txBody,
                         privateKey: privateKey) { tx in
            RpcService.broadcast(tx: tx) { result in
                successCallback(result)
            } errorCallBack: { error in
                errorCallBack(error)
            }

        }
        
    }
    
    /// 根据denom(创建时的symbol)查询token信息
    /// - Parameters:
    ///   - denom: 分类ID
    ///   - callback: token信息
    /// - Returns:
    public func tokenInfo(tokenSymbol: String,
                          successCallback: @escaping (_ token: Token) -> (),
                          errorCallBack: @escaping FPErrorCallback)  {
       
        var request = TokenQueryTokenRequest()
        request.denom = tokenSymbol
        
        let client = TokenQueryClient(channel: IRISServive.channel)
        let response = client.token(request).response
        
        response.whenComplete { result in
            switch result {
            case .success(let value):
                if let token = try? TokenToken(serializedData: value.token.value) {
                    successCallback(self.formatToken(token))
                } else {
                    errorCallBack("Invalid data")
                }
            case .failure(let error):
                errorCallBack("\(error)")
            }
        }
    }
    
    /**
     * 根据地址查询拥有的token
     *
     * @param address
     * @return
     * @throws InvalidProtocolBufferException
     */
    public func tokensByOwner(owner: String,
                              successCallback: @escaping (_ tokenList: [Token]) -> (),
                              errorCallBack: @escaping FPErrorCallback) {
        
        var request = TokenQueryTokensRequest()

        if let addressValue = TxUtils.fromBech32(owner) {
            request.owner = addressValue
        }
        let client = TokenQueryClient(channel: IRISServive.channel)
        let response = client.tokens(request).response
        response.whenComplete { result in
            switch result {
            case .success(let value):
                let dataList = value.tokens
                var tokenList = [Token]()
                for data in dataList {
                    if let token = try? TokenToken(serializedData: data.value) {
                        tokenList.append(self.formatToken(token))
                    }
                }
                successCallback(tokenList)
            case .failure(let error):
                errorCallBack("\(error)")
            }
        }
    }
    
    /**
     * mint资产，估算交易费
     *
     * @param tokenSymbol
     * @return
     * @throws ServiceException
     */
    public func issueFees(tokenSymbol: String,
                          successCallback: @escaping (_ coin: Coin) -> (),
                          errorCallBack: @escaping FPErrorCallback) {
        
        var request = TokenQueryFeesRequest()
        request.symbol = tokenSymbol
        
        let response = TokenQueryClient(channel: IRISServive.channel).fees(request).response
        response.whenComplete { result in
            switch result {
            case .success(let value):
                self.formatCoin(coinOuter: value.issueFee) { coin in
                    successCallback(coin)
                } errorCallBack: { error in
                    errorCallBack(error)
                }
            case .failure(let error):
                errorCallBack("\(error)")
            }
        }
    }
    
    /**
       * 查询拥有的token
       * @param address
       * @param tokenSymbol
       * @return
       * @throws ServiceException
    */
    public func balance(address: String,
                        tokenSymbol: String,
                        successCallback: @escaping (_ coin: Coin) -> (),
                        errorCallback: @escaping FPErrorCallback) {
                
        let client = BankQueryClient(channel: IRISServive.channel)
        var req = BankQueryBalanceRequest()
        req.address = address
        req.denom = tokenSymbol
        let res = client.balance(req)
        res.response.whenComplete { result in
            switch result {
            case .success(let value):
               
                self.formatCoin(coinOuter: value.balance) { coin in
                    successCallback(coin)
                } errorCallBack: { error in
                    errorCallback(error)
                }
                
            case .failure(let error):
                errorCallback("\(error)")
            }
        }
    }
    
    /**
      * 查询所拥有的token
      * @param owner
    */
    public func allBalances(owner: String,
                            successCallback: @escaping (_ coins: [Coin]) -> (),
                            errorCallback: @escaping FPErrorCallback) {
                
        let client = BankQueryClient(channel: IRISServive.channel)
        var req = BankQueryAllBalancesRequest()
        req.address = owner
        let res = client.allBalances(req)
        res.response.whenComplete { result in
            switch result {
            case .success(let value):
                self.formatCoinArray(coinList: value.balances) { coins in
                    successCallback(coins)
                } errorCallBack: { error in
                    errorCallback(error)
                }
            case .failure(let error):
                errorCallback("\(error)")
            }
        }
    }
    
    /**
     * 总共的token
     *
     * @return
     * @throws ServiceException
     */
    public func totalSupply(successCallback: @escaping (_ coins: [Coin]) -> (),
                            errorCallback: @escaping FPErrorCallback) {
                
        let client = BankQueryClient(channel: IRISServive.channel)
        let req = BankQueryTotalSupplyRequest()

        let res = client.totalSupply(req)
        res.response.whenComplete { result in
            switch result {
            case .success(let value):
                let coinList = value.supply
                self.formatCoinArray(coinList: coinList) { coins in
                    successCallback(coins)
                } errorCallBack: { error in
                    errorCallback(error)
                }
            case .failure(let error):
                errorCallback("\(error)")
            }
        }
    }
    
    /**
     * token总量
     *
     * @param tokenSymbol
     * @return
     * @throws ServiceException
     */
    public func supplyOf(tokenSymbol: String,
                         successCallback: @escaping (_ coin: Coin) -> (),
                         errorCallback: @escaping FPErrorCallback) {
                
        let client = BankQueryClient(channel: IRISServive.channel)
        var req = BankQuerySupplyOfRequest()
        req.denom = tokenSymbol
        let res = client.supplyOf(req)
        res.response.whenComplete { result in
            switch result {
            case .success(let value):
                self.formatCoin(coinOuter: value.amount) { coin in
                    successCallback(coin)
                } errorCallBack: { error in
                    errorCallback(error)
                }
            case .failure(let error):
                errorCallback("\(error)")
            }
        }
    }
    
    /// 精度转换
    public func toWei(tokenSymblol: String,
                      amount: Decimal,
                      successCallback: @escaping (_ amount: String) -> (),
                      errorCallBack: @escaping FPErrorCallback) {
     
        self.tokenInfo(tokenSymbol: tokenSymblol) { token in
            var amount = amount
            var result = Decimal()
            NSDecimalMultiplyByPowerOf10(&result, &amount, Int16(token.scale), .plain)
            var rounded = Decimal()
            NSDecimalRound(&rounded, &result, 0, .down)
            let resultstring = NSDecimalString(&rounded, nil)
            successCallback(resultstring)
        } errorCallBack: { error in
            errorCallBack(error)
        }

    }
    
    /// 精度转换
    public func forWei(tokenSymblol: String,
                            amount: Decimal,
                            successCallback: @escaping (_ amount: String) -> (),
                            errorCallBack: @escaping FPErrorCallback) {
     
        self.tokenInfo(tokenSymbol: tokenSymblol) { token in
            var amount = amount
            var result = Decimal()
            NSDecimalMultiplyByPowerOf10(&result, &amount, -Int16(token.scale), .plain)
            let resultstring = NSDecimalString(&result, nil)
            successCallback(resultstring)
        } errorCallBack: { error in
            print(error)
            errorCallBack(error)
        }
    }
    
    func formatToken(_ token: TokenToken) -> Token {
        
        let owner = Bech32Utils.toBech32(hrp: AddressUtils.HRP, pubkeyHexData: token.owner)
        let entity = Token()
        entity.initialSupply = token.initialSupply
        entity.maxSupply = token.maxSupply
        entity.mintAble = token.mintable
        entity.minUnit = token.minUnit
        entity.name = token.name
        entity.scale = token.scale
        entity.symbol = token.symbol
        entity.owner = owner
        return entity
    }
    
    func formatCoin(coinOuter: BaseCoin,
                    successCallback: @escaping (_ coin: Coin) -> (),
                    errorCallBack: @escaping FPErrorCallback) {
        
        self.toWei(tokenSymblol: coinOuter.denom,
                   amount: Decimal(string: coinOuter.amount)!) { amount in
            var coin = Coin()
            coin.denom = coinOuter.denom
            coin.amount = amount
            successCallback(coin)
        } errorCallBack: { error in
            errorCallBack(error)
        }

    }
        
    func formatCoinArray(coinList: [BaseCoin],
                         successCallback: @escaping (_ coins: [Coin]) -> (),
                         errorCallBack: @escaping FPErrorCallback) {
       
        for item in coinList {
            self.toWei(tokenSymblol: item.denom,
                       amount: Decimal(string: item.amount)!) { amount in
                var coins = [Coin]()
                var coin = Coin()
                coin.denom = item.denom
                coin.amount = amount
                coins.append(coin)
                successCallback(coins)
            } errorCallBack: { error in
                errorCallBack(error)
            }

        }
    }
}
