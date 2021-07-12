//
//  AuthTests.swift
//  GBShopTests
//
//  Created by Константин Кузнецов on 01.07.2021.
//

import XCTest
@testable import GBShop

class AuthTests: XCTestCase {
    
    var requestFactory: RequestFactory?
    var authFactory: AuthRequestFactory?

    override func setUpWithError() throws {
        requestFactory = RequestFactory()
        authFactory = requestFactory?.makeAuthRequestFatory()
    }

    override func tearDownWithError() throws {
        requestFactory = nil
        authFactory = nil
    }
    
    func testRegister() throws {
        
        let expectation = XCTestExpectation(description: "register")
        
        authFactory?.register(userId: 123,
                              userName: "Somebody",
                              password: "mypassword",
                              email: "some@some.ru",
                              gender: "m",
                              creditCard: "9872389-2424-234224-234",
                              bio: "This is good! I think I will switch to another language",
                              completionHandler: { (response) in
                                switch response.result{
                                case .success(let register):
                                    XCTAssertEqual(register.result, 1)
                                    expectation.fulfill()
                                case .failure(let error):
                                    XCTFail(error.localizedDescription)
                                }
                              })
        
        wait(for: [expectation], timeout: 5)
        
    }

    func testLogin() throws {
        
        let expectation = XCTestExpectation(description: "login")
        
        authFactory?.login(userName: "Somebody",
                           password: "mypassword",
                           completionHandler: { (response) in
                            switch response.result{
                            case .success(let login):
                                XCTAssertEqual(login.user.id, 123)
                                expectation.fulfill()
                            case .failure(let error):
                                XCTFail(error.localizedDescription)
                            }
                           })
        
        wait(for: [expectation], timeout: 5)
        
    }
    
    func testChangeData() throws {
        let expectation = XCTestExpectation(description: "changeData")
        
        authFactory?.changeUserData(userId: 123,
                                    userName: "Somebody",
                                    password: "mypassword",
                                    email: "some@some.ru",
                                    gender: "m",
                                    creditCard: "9872389-2424-234224-234",
                                    bio: "This is good! I think I will switch to another language",
                                    completionHandler: { (response) in
                                        switch response.result{
                                        case .success(let userData):
                                            XCTAssertEqual(userData.result, 1)
                                            expectation.fulfill()
                                        case .failure(let error):
                                            XCTFail(error.localizedDescription)
                                        }
                                    })
        
        wait(for: [expectation], timeout: 5)
        
    }
    
    func testLogout() throws {
        
        let expectation = XCTestExpectation(description: "logout")
        
        authFactory?.logout(userId: 123,
                            authToken: "Token",
                            completionHandler: { (response) in
                                switch response.result{
                                case .success(let logout):
                                    XCTAssertEqual(logout.result, 1)
                                    expectation.fulfill()
                                case .failure(let error):
                                    XCTFail(error.localizedDescription)
                                }
                            })
        
        wait(for: [expectation], timeout: 5)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
