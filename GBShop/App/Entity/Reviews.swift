//
//  Reviews.swift
//  GBShop
//
//  Created by Константин Кузнецов on 08.07.2021.
//

import Foundation

struct Reviews: Codable {
    let id: Int
    let rating: Int
    let userName: String
    let email: String
    let dignities: String
    let disadvantages: String
    let comment: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case rating = "rating"
        case userName = "user_name"
        case email = "email"
        case dignities = "dignities"
        case disadvantages = "disadvantages"
        case comment = "comment"
    }
}
