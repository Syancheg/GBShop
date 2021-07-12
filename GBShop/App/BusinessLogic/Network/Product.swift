//
//  Product.swift
//  GBShop
//
//  Created by Константин Кузнецов on 01.07.2021.
//

import Foundation
import Alamofire

class Product: AbstractRequestFactory {
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

extension Product: ProductRequestFactory {
    func getProduct(id: Int,
                    oauthToken: String,
                    completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void) {
        let requestModel = ProductById(baseUrl: StringResources.baseURL,
                                       id: 123,
                                       oauthToken: oauthToken)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
    
    func getProducts(oauthToken: String,
                     nextPageToken: String,
                     prevPageToken: String,
                     limit: Int,
                     offset: Int,
                     completionHandler: @escaping (AFDataResponse<ProductListResult>) -> Void) {
        let requestModel = ProductList(baseUrl: StringResources.baseURL,
                                       oauthToken: oauthToken,
                                       nextPageToken: nextPageToken,
                                       prevPageToken: prevPageToken,
                                       limit: limit,
                                       offset: offset)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
}

extension Product {
    struct ProductById: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = StringResources.product
        
        let id: Int
        let oauthToken: String
        var parameters: Parameters? {
            return [
                "id_product": id,
                "authToken": oauthToken
            ]
        }
    }
    
    struct ProductList: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = StringResources.products
        
        let oauthToken: String
        let nextPageToken: String
        let prevPageToken: String
        let limit: Int
        let offset: Int
        var parameters: Parameters? {
            return [
                "authToken": oauthToken,
                "nextPageToken": nextPageToken,
                "prevPageToken": prevPageToken,
                "limit": limit,
                "offset": offset
            ]
        }
    }
}

