//
//  ReviewRequestFactory.swift
//  GBShop
//
//  Created by Константин Кузнецов on 08.07.2021.
//

import Foundation
import Alamofire

protocol ReviewRequestFactory {
    func getReviews(nextPageToken: String,
                    prevPageToken: String,
                    limit: Int,
                    offset: Int,
                    completionHandler: @escaping (AFDataResponse<ReviewListResult>) -> Void)
    func addReview(rating: Int,
                    userName: String,
                    email: String,
                    dignities: String,
                    disadvantages: String,
                    comment: String,
                    completionHandler: @escaping (AFDataResponse<ReviewAddRemoveResult>) -> Void)
    func removeReview(id: Int,
                      completionHandler: @escaping (AFDataResponse<ReviewAddRemoveResult>) -> Void)
}
