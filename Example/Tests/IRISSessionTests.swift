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
        IRISServive.chainId = "bifrost-2"
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
    
    func testTokenServiceBalance() {
        let expectation = self.expectation(description: "testTokenServiceBalance")

        TokenService.balance(address: "iaa1fu5xru6umtfqthe588z6zk37gdknulr55ee5qf",
                             denom: "ubif") { coin in
            print(coin.denom)
            print(coin.amount)
            expectation.fulfill()
        } errorCallback: { error in
            print(error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15, handler: nil)
    }
    
    
    func testAllNfts() {
        let expectation = self.expectation(description: "testAllNfts")
        NFTService.allNfts { list in
            print(list)
            for l in list {
                print(l.creator)
                print(l.name)
                print(l.id)
                print(l.schema)
                print(l.tokens)
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
//        NFTService.supply(owner: "iaa1fu5xru6umtfqthe588z6zk37gdknulr55ee5qf", denom: "ubif") successCallback: { amount in
//            print("amount:\(amount)")
//            expectation.fulfill()
//        } errorCallback: { error in
//            print(error)
//            expectation.fulfill()
//        }
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
