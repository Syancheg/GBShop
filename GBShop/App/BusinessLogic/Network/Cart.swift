//
//  Cart.swift
//  GBShop
//
//  Created by Константин Кузнецов on 12.07.2021.
//

import Foundation
import Alamofire

class Cart: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Cart: CartRequestFactory {
    func addProduct(idProduct: Int, completionHandler: @escaping (AFDataResponse<CartResult>) -> Void) {
        let requestModel = addProductToCart(baseUrl: StringResources.baseURL,
                                            idProduct: 3)
        self.request(request: requestModel,
                             completionHandler: completionHandler)
    }
    
    func removeProduct(idProduct: Int, completionHandler: @escaping (AFDataResponse<CartResult>) -> Void) {
        let requestModel = removeProductFromCart(baseUrl: StringResources.baseURL,
                                                 idProduct: 3)
        self.request(request: requestModel,
                             completionHandler: completionHandler)
    }
    
    func payBasket(idCart: Int, completionHandler: @escaping (AFDataResponse<CartConfirmResult>) -> Void) {
        let requestModel = confirmCart(baseUrl: StringResources.baseURL, idCart: 432)
        self.request(request: requestModel,
                      completionHandler: completionHandler)
    }
}

extension Cart {
    struct addProductToCart: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = StringResources.addProductToCart
        
        let idProduct: Int
        var parameters: Parameters? {
            return [
                "id_product": idProduct
            ]
        }
    }
    
    
    struct removeProductFromCart: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = StringResources.removeProductFromCart
        
        let idProduct: Int
        var parameters: Parameters? {
            return [
                "id_product": idProduct
            ]
        }
    }
    
    struct confirmCart: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = StringResources.payBasket
        
        let idCart: Int
        var parameters: Parameters? {
            return [
                "id_cart": idCart
            ]
        }
    }
}
