//
//  LogoutResult.swift
//  GBShop
//
//  Created by Константин Кузнецов on 28.06.2021.
//

import Foundation

struct LogoutResult: Codable {
    let result: Int
    let errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case errorMessage = "error_message"
    }
}
