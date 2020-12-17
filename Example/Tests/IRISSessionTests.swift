//
//  IRISSessionTests.swift
//  DmaIRIS_SDK_IOS_Tests
//
//  Created by StarryMedia on 2020/12/14.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
import UptickProtocolIRISnet

class IRISSessionTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        IRISServive.host = "34.80.22.255"
        IRISServive.port = 9090
        IRISServive.chainId = "bifrost-1"
        MerchantService.nodeUrl = "http://52.81.146.252:8091"
        RpcService.rpcUrl = "http://34.80.22.255:26657"

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testBankTransfer() {
        
        let expectation = self.expectation(description: "testBankTransfer")

        let from="iaa1fu5xru6umtfqthe588z6zk37gdknulr55ee5qf"
        let to = "iaa1nhu8qvj232mwxllwwxs4m9zz5pqcxazpmxtm8z"
        let privateKey="0f6f503144fd27a530f0ed5867fc19aae3a86bd41a021ddffd065519bbf11fed"
        
        BankService.transfer(from: from,
                             to: to,
                             value: "10",
                             denom: "ubif",
                             privateKey: privateKey) { res in
            print("res=====\(res.toJSONString(prettyPrint: true)!)")
            expectation.fulfill()
        } errorCallBack:{ error in
            print(error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testRequestQueryAccount() {
        let expectation = self.expectation(description: "testRequestQueryAccount")
    
        AuthService.queryAccount(address: "iaa1fu5xru6umtfqthe588z6zk37gdknulr55ee5qf") { (address, sequence, accountNumber) in
            print("address:\(address)")
            print("sequence:\(sequence)")
            print("accountNumber:\(accountNumber)")
            expectation.fulfill()
        } errorCallback: { error in
            print(error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15, handler: nil)
    }
    
    func testRequestQueryBalance() {
        let expectation = self.expectation(description: "testRequestQueryBalance")

        NFTService.balance(owner: "iaa1fu5xru6umtfqthe588z6zk37gdknulr55ee5qf",
                           nftId: "") { list in
            print("amount:\(list)")
            expectation.fulfill()

        } errorCallback: { error in
            print("error:\(error)")
            expectation.fulfill()

        }

        waitForExpectations(timeout: 15, handler: nil)
    }
    
    func testRequestQueryAllBalance() {
        let expectation = self.expectation(description: "testRequestQueryAllBalance")
        BankService.queryAllBalance(address: "iaa1fu5xru6umtfqthe588z6zk37gdknulr55ee5qf") { balances in
            print("balances:\(balances)")
            expectation.fulfill()
        } errorCallback: { error in
            print("error:\(error)")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15, handler: nil)
    }
    
    func testRequestQueryTotalSupply() {
        let expectation = self.expectation(description: "testRequestQueryAllBalance")
        BankService.queryTotalSupply { coins in
            print("\(coins)")
            expectation.fulfill()
        } errorCallback: { error in
            print("error:\(error)")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15, handler: nil)
    }
    
    func testRequestQuerySupplyOf() {
        let expectation = self.expectation(description: "testRequestQueryAllBalance")
        BankService.querySupplyOf(denom: "ubif") { coin in
            print("\(coin)")
            expectation.fulfill()
        } errorCallback: { error in
            print("error:\(error)")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15, handler: nil)
    }

    func testERC20TokenServiceToken() {
        let expectation = self.expectation(description: "testERC20TokenServiceToken")
        ERC20TokenService.token(denom: "ubif") { scale in
            print("scale:\(scale)")
            expectation.fulfill()
        } errorCallBack: { error in
            print("error:\(error)")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15, handler: nil)
    }
    
    func testQueryAllNfts() {
        let expectation = self.expectation(description: "testQueryAllNfts")
        NFTService.allNfts { denoms in
//            print(denoms)
            for de in denoms {
                print(de.name)
            }
            expectation.fulfill()
        } errorCallback: { error in
            print(error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15, handler: nil)
    }
    
    func testQuerySupply() {
        let expectation = self.expectation(description: "testQuerySupply")
        NFTService.supply(owner: "iaa1fu5xru6umtfqthe588z6zk37gdknulr55ee5qf", nftId: "ubif") { amount in
            print("amount:\(amount)")
            expectation.fulfill()
        } errorCallback: { error in
            print(error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15, handler: nil)
    }
    
    func testGetAllAsset() {
        let expectation = self.expectation(description: "testGetAllAsset")
        MerchantService.getAllAsset { lists in
            print(lists!)
            expectation.fulfill()
        } errorCallback: { error in
            print(error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15, handler: nil)

    }
    
    func testDoSign() {
        print("======================================")
        print("======================================")
        print("======================================")
        print("======================================")
        print("======================================")
        print("======================================")
        print("======================================")

        let data = "123456"
        let privateKey = "1779b474da9ef4aef67271f455dd58054d3181863b91f63910074f3cb9123591"
        let result = SignUtils.doSignDataEntity(data: data, privateKey: privateKey)
        print("result:\(result.toString())")
        print("======================================")
        print("======================================")
        print("======================================")
        print("======================================")
        print("======================================")
        print("======================================")

    }
}
