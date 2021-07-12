//
//  Review.swift
//  GBShop
//
//  Created by Константин Кузнецов on 08.07.2021.
//

import Foundation
import Alamofire

class Review: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Review: ReviewRequestFactory {
    func getReviews(nextPageToken: String, prevPageToken: String, limit: Int, offset: Int, completionHandler: @escaping (AFDataResponse<ReviewListResult>) -> Void) {
        let requestModel = ListReview(baseUrl: StringResources.baseURL,
                                      nextPageToken: nextPageToken,
                                      prevPageToken: prevPageToken,
                                      limit: limit, offset: offset)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
    
    func addReview(rating: Int,
                   userName: String,
                   email: String,
                   dignities: String,
                   disadvantages: String,
                   comment: String,
                   completionHandler: @escaping (AFDataResponse<ReviewAddRemoveResult>) -> Void) {
        let requestModel = AddReview(baseUrl: StringResources.baseURL,
                                     rating: rating,
                                     userName: userName,
                                     email: email,
                                     dignities: dignities,
                                     disadvantages: disadvantages,
                                     comment: comment)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
    
    func removeReview(id: Int, completionHandler: @escaping (AFDataResponse<ReviewAddRemoveResult>) -> Void) {
        let requestModel = RemoveReview(baseUrl: StringResources.baseURL,
                                        id: 3)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
    
    
}

extension Review {
    struct ListReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = StringResources.reviews
        
        let nextPageToken: String
        let prevPageToken: String
        let limit: Int
        let offset: Int
        var parameters: Parameters? {
            return [
                "nextPageToken": nextPageToken,
                "prevPageToken": prevPageToken,
                "limit": limit,
                "offset": offset
            ]
        }
    }
    
    struct RemoveReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = StringResources.removeReview
        
        let id: Int
        var parameters: Parameters? {
            return [
                "id": id
            ]
        }
    }
    
    struct AddReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = StringResources.addReview
        
        let rating: Int
        let userName: String
        let email: String
        let dignities: String
        let disadvantages: String
        let comment: String
        var parameters: Parameters? {
            return [
                "rating": rating,
                "user_name": userName,
                "email": email,
                "dignities": dignities,
                "disadvantages": disadvantages,
                "comment": comment
            ]
        }
    }

}
