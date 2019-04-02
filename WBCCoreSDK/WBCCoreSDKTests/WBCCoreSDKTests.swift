//
//  WBCCoreSDKTests.swift
//  WBCCoreSDKTests
//
//  Created by Wetek on 01/04/2019.
//  Copyright © 2019 Waves Provider. All rights reserved.
//

import XCTest
@testable import WBCCoreSDK

class WBCCoreSDKTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLogin() {
        let expectation = XCTestExpectation(description: "Expect to pass login")
        let test = Network()
        let endpoint = UserEndpoints.login(username: "admin@wetek.com", password: "weteksss")
        
        test.sendRequest(endpoint: endpoint, completion: { () -> Void in
            print("hello")
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 10)
    }

}
