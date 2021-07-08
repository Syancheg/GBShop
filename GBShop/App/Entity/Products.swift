//
//  Products.swift
//  GBShop
//
//  Created by Константин Кузнецов on 08.07.2021.
//

import Foundation

struct Products: Codable {
    let id: Int
    let productName: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case productName = "product_name"
        case price = "price"
        
    }
}
