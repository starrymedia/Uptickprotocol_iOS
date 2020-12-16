//
//  QueryServiceTests.swift
//  DmaIRIS_SDK_IOS_Tests
//
//  Created by StarryMedia on 2020/12/16.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
import UptickProtocolIRISnet

class QueryServiceTests: XCTestCase {

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
        
        let params = BroadcastRequestParams(tx: "txString")
        let broadcast = BroadcastRequest(id: "service_client",
                                     jsonrpc: "2.0",
                                     method: "broadcast_tx_commit",
                                     params: params)
        print(broadcast)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSearchTxs() {
        let expectation = self.expectation(description: "testSearchTxs")
//        let actionType =  ActionType(rawValue: "message.sender")!
        let sender = "iaa1fu5xru6umtfqthe588z6zk37gdknulr55ee5qf"
        QueryService.searchTxs(sender: sender,
                               page: 1,
                               size: 10) { jsonString in
            print(jsonString.toJSON()!)
            expectation.fulfill()
        } errorCallBack: { error in
            print(error)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 60, handler: nil)
    }
    
 
    func testQueryTxByHash() {
        let expectation = self.expectation(description: "testQueryTxByHash")
        let hash = "02E7499ACB7A968D286127F57180CEA7E718ACC181FF199DE9F878CAE3F92BCA"
        QueryService.queryTxByHash(hash: hash) { result in
            print(result.toJSON()!)
            expectation.fulfill()
        } errorCallBack: { error in
            print(error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 60, handler: nil)
    }
 

}
