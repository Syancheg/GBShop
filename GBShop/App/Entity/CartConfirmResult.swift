//
//  CartConfirmResult.swift
//  GBShop
//
//  Created by Константин Кузнецов on 12.07.2021.
//

import Foundation

struct CartConfirmResult: Codable {
    let result: Int
    let products: [Products]
    let totalPrice: Int
    let message: String?
    let errorMassage: String?
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case products = "products"
        case totalPrice = "total_price"
        case message = "message"
        case errorMassage = "error_message"
    }
}
