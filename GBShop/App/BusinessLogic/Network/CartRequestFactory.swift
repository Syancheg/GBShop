//
//  CartRequestFactory.swift
//  GBShop
//
//  Created by Константин Кузнецов on 12.07.2021.
//

import Foundation

import Alamofire

protocol CartRequestFactory {
    func addProduct(idProduct: Int,
                    completionHandler: @escaping (AFDataResponse<CartResult>) -> Void)
    func removeProduct(idProduct: Int,
                    completionHandler: @escaping (AFDataResponse<CartResult>) -> Void)
    func payBasket(idCart: Int,
                    completionHandler: @escaping (AFDataResponse<CartConfirmResult>) -> Void)
    
}
