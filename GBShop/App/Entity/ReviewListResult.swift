//
//  ReviewListResult.swift
//  GBShop
//
//  Created by Константин Кузнецов on 08.07.2021.
//

import Foundation

struct ReviewListResult: Codable {
    let result: Int
    let reviews: [Reviews]
    let errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case reviews = "reviews"
        case errorMessage = "error_message"
    }
}
