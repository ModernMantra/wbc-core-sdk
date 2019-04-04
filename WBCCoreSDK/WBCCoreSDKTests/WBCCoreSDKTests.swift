
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
        let test = Network<LoginResource>()
      
        let endpoint = UserEndpoints.login(username: "admin@wetek.com", password: "wetek")
        
        test.sendRequest(endpoint: endpoint, completion: { (error, result) in
            print("")
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 10)
    }

}
