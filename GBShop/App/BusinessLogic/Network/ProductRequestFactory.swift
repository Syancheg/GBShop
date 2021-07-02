//
//  ProductRequestFactory.swift
//  GBShop
//
//  Created by Константин Кузнецов on 01.07.2021.
//

import Foundation
import Alamofire

protocol ProductRequestFactory {
    func getProduct(id: Int,
                    oauthToken: String,
                    completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void)
    func getProducts(oauthToken: String,
                     nextPageToken: String,
                     prevPageToken: String,
                     limit: Int,
                     offset: Int,
                     completionHandler: @escaping (AFDataResponse<[ProductListResult]>) -> Void)
}
