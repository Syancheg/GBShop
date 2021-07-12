//
//  ReviewTests.swift
//  GBShopTests
//
//  Created by Константин Кузнецов on 12.07.2021.
//

import XCTest
@testable import GBShop

class ReviewTests: XCTestCase {
    
    var requestFactory: RequestFactory?
    var reviewFactory: ReviewRequestFactory?

    override func setUpWithError() throws {
        requestFactory = RequestFactory()
        reviewFactory = requestFactory?.makeReviewRequaetFactory()
    }

    override func tearDownWithError() throws {
        requestFactory = nil
        reviewFactory = nil
    }

    func testAddReview() throws {
        let expectation = XCTestExpectation(description: "add_review")
        
        reviewFactory?.addReview(rating: 5,
                                 userName: "String",
                                 email: "str@test.ru",
                                 dignities: "",
                                 disadvantages: "",
                                 comment: "",
                                 completionHandler: { (response) in
                                    switch response.result{
                                    case .success(let review):
                                        XCTAssertEqual(review.result, 1)
                                        expectation.fulfill()
                                    case .failure(let error):
                                        XCTFail(error.localizedDescription)
                                    }
                                 })
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testRemoveReview() throws {
        
        let expectation = XCTestExpectation(description: "remove_review")
        
        reviewFactory?.removeReview(id: 1,
                                    completionHandler: { (response) in
                                        switch response.result{
                                        case .success(let review):
                                            XCTAssertEqual(review.result, 1)
                                            expectation.fulfill()
                                        case .failure(let error):
                                            XCTFail(error.localizedDescription)
                                        }
                                    })
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testGetReviews() throws {
        
        let expectation = XCTestExpectation(description: "remove_review")
        
        reviewFactory?.getReviews(nextPageToken: "",
                                  prevPageToken: "",
                                  limit: 5,
                                  offset: 0,
                                  completionHandler: { (response) in
                                    switch response.result{
                                    case .success(let review):
                                        XCTAssertEqual(review.result, 1)
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
