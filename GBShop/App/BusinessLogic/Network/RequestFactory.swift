//
//  RequestFactory.swift
//  GBShop
//
//  Created by Константин Кузнецов on 28.06.2021.
//

import Foundation
import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeProductRequaetFactory() -> ProductRequestFactory {
        let errorParser = makeErrorParser()
        return Product(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeReviewRequaetFactory() -> ReviewRequestFactory {
        let errorParser = makeErrorParser()
        return Review(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}
