//
//  ProductTests.swift
//  GBShop
//
//  Created by Константин Кузнецов on 01.07.2021.
//

import XCTest
@testable import GBShop

class ProductTests: XCTestCase {

    var requestFactory: RequestFactory?
    var productsFactory: ProductRequestFactory?
    
    override func setUpWithError() throws {
        requestFactory = RequestFactory()
        productsFactory = requestFactory?.makeProductRequaetFactory()
    }

    override func tearDownWithError() throws {
        requestFactory = nil
        productsFactory = nil
    }

    func testProduct() throws {
        
        let expectation = XCTestExpectation(description: "getProduct")
        
        productsFactory?.getProduct(id: 123, oauthToken: "token", completionHandler: { (response) in
            switch response.result{
            case .success(let product):
                XCTAssertEqual(product.name, "Ноутбук")
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        })
        wait(for: [expectation], timeout: 5)
        
    }
    
    func testProducts() throws {
        
        let expectation = XCTestExpectation(description: "getProducts")
        
        productsFactory?.getProducts(oauthToken: "token", nextPageToken: "", prevPageToken: "", limit: 10, offset: 0, completionHandler: { (response) in
            switch response.result{
            case .success(let products):
                XCTAssertNotNil(products)
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
