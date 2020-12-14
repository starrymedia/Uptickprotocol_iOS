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
    
    func testRequestQueryBalance() {
        let expectation = self.expectation(description: "testRequestQueryBalance")
        BankService.queryBalance(address: "iaa1fu5xru6umtfqthe588z6zk37gdknulr55ee5qf",
                                 denom: "ubif") { amount in
            print("amount:\(amount)")
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
        NFTService.queryAllNfts { denoms in
            print(denoms)
            expectation.fulfill()
        } errorCallback: { error in
            print(error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15, handler: nil)
    }
    
    func testQuerySupply() {
        let expectation = self.expectation(description: "testQuerySupply")
        NFTService.querySupply(owner: "iaa1fu5xru6umtfqthe588z6zk37gdknulr55ee5qf", nftId: "ubif") { amount in
            print("amount:\(amount)")
            expectation.fulfill()
        } errorCallback: { error in
            print(error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15, handler: nil)
    }
}
