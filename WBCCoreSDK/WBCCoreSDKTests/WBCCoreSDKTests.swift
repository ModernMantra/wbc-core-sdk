
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


    
    func testCity() {
        let expectationForLogin = XCTestExpectation(description: "Expect to pass login")
        let expectationForcity  =  XCTestExpectation(description: "Expect to have valid token")
        
        let login = Network<LoginResource>()
        
        let endpointLogin = UserEndpoints.login(username: "admin@wetek.com", password: "wetek")
        
        login.sendRequest(endpoint: endpointLogin, completion: { (error, result) in
            print("")
            expectationForLogin.fulfill()
            
            let city = Network<CitiesResource>()
            
            let endpointCity = CityEndPoints.cities(token: (result?.access_token)!, limit: nil, order: nil, direction: nil)
            
            city.sendRequest(endpoint: endpointCity, completion: { (errorOfCity, resultOfCity) in
                print("\(resultOfCity)")
                expectationForcity.fulfill()
            })
            self.wait(for: [expectationForcity], timeout: 15)
            
        })

        wait(for: [expectationForLogin], timeout: 10)
    }

    func testOperators() {
        let expectationForLogin = XCTestExpectation(description: "Expect to pass login")
        let expectationForcity  =  XCTestExpectation(description: "Expect to have valid token")
        
        let login = Network<LoginResource>()
        
        let endpointLogin = UserEndpoints.login(username: "admin@wetek.com", password: "wetek")
        
        login.sendRequest(endpoint: endpointLogin, completion: { (error, result) in
            print("")
            expectationForLogin.fulfill()
            
            let operators = Network<OperatorResource>()
            
            let endpointOperator = ActiveOperatorsEndPoint.operators(token: (result?.access_token)!, limit: nil, order: nil, direction: nil)
            
            operators.sendRequest(endpoint: endpointOperator, completion: { (errorOfOperator, resultOfOperator) in
                print("\(resultOfOperator)")
                expectationForcity.fulfill()
            })
            self.wait(for: [expectationForcity], timeout: 15)
            
        })
        
        wait(for: [expectationForLogin], timeout: 10)
    }

}

