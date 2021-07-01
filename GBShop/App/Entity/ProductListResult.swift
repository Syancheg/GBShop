//
//  ProductListResult.swift
//  GBShop
//
//  Created by Константин Кузнецов on 01.07.2021.
//

import Foundation

struct ProductListResult: Codable {
    let productId: Int
    let name: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case productId = "id_product"
        case name = "product_name"
        case price = "price"
    }
}
