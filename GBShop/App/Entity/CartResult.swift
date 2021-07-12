//
//  CartResult.swift
//  GBShop
//
//  Created by Константин Кузнецов on 12.07.2021.
//

import Foundation

struct CartResult: Codable {
    let result: Int
    let products: [Products]
    let totalPrice: Int
    let errorMassage: String?
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case products = "products"
        case totalPrice = "total_price"
        case errorMassage = "error_message"
    }
}
