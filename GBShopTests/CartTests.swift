//
//  CartTests.swift
//  GBShopTests
//
//  Created by Константин Кузнецов on 12.07.2021.
//

import XCTest
@testable import GBShop

class CartTests: XCTestCase {
    
    var requestFactory: RequestFactory?
    var cartFactory: CartRequestFactory?

    override func setUpWithError() throws {
        requestFactory = RequestFactory()
        cartFactory = requestFactory?.makeCartRequestFactory()
    }

    override func tearDownWithError() throws {
        requestFactory = nil
        cartFactory = nil
    }

    func testAddProductToCart() throws {
        
        let expectation = XCTestExpectation(description: "add_product_to_cart")
        
        cartFactory?.addProduct(idProduct: 1,
                                completionHandler: { (response) in
                                    switch response.result{
                                    case .success(let cart):
                                        XCTAssertEqual(cart.result, 1)
                                        expectation.fulfill()
                                    case .failure(let error):
                                        XCTFail(error.localizedDescription)
                                    }
                                })
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testRemoveProductFromCart() throws {
        
        let expectation = XCTestExpectation(description: "remove_product_from_cart")
        
        cartFactory?.removeProduct(idProduct: 1,
                                   completionHandler: { (response) in
                                    switch response.result{
                                    case .success(let cart):
                                        XCTAssertEqual(cart.result, 1)
                                        expectation.fulfill()
                                    case .failure(let error):
                                        XCTFail(error.localizedDescription)
                                    }
                                   })
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testPayBasket() throws {
        
        let expectation = XCTestExpectation(description: "pay_basket")
        
        cartFactory?.payBasket(idCart: 3,
                               completionHandler: { (response) in
                                switch response.result{
                                case .success(let cart):
                                    XCTAssertEqual(cart.result, 1)
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
