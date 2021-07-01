//
//  LoginResult.swift
//  GBShop
//
//  Created by Константин Кузнецов on 28.06.2021.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let user: User
    let authToken: String
}
