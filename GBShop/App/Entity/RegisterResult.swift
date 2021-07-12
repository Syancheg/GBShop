//
//  RegisterResult.swift
//  GBShop
//
//  Created by Константин Кузнецов on 28.06.2021.
//

import Foundation

struct RegisterResult: Codable {
    let result: Int
    let userMessage: String?
    let errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case userMessage = "user_message"
        case errorMessage = "error_message"
    }
}
