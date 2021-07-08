//
//  ProductListResult.swift
//  GBShop
//
//  Created by Константин Кузнецов on 01.07.2021.
//

import Foundation

struct ProductListResult: Codable {
    let result: Int
    let products: [Products]
    let errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case products = "products"
        case errorMessage = "error_message"
    }
}
