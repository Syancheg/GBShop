//
//  Auth.swift
//  GBShop
//
//  Created by Константин Кузнецов on 28.06.2021.
//

import Foundation
import Alamofire

class Auth: AbstractRequestFactory {
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

extension Auth: AuthRequestFactory {
    func login(userName: String,
               password: String,
               completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void) {
        let requestModel = Login(baseUrl: StringResources.baseURL,
                                 login: userName,
                                 password: password)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
    
    func register(userId: Int,
                  userName: String,
                  password: String,
                  email: String,
                  gender: String,
                  creditCard: String,
                  bio: String,
                  completionHandler: @escaping (AFDataResponse<RegisterResult>) -> Void) {
        
        let requestModel = UserData(baseUrl: StringResources.baseURL,
                                    method: .post,
                                    path: StringResources.registerUser,
                                    userId: userId,
                                    login: userName,
                                    password: password,
                                    email: email,
                                    gender: gender,
                                    creditCard: creditCard,
                                    bio: bio)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
    
    func changeUserData(userId: Int,
                        userName: String,
                        password: String,
                        email: String,
                        gender: String,
                        creditCard: String,
                        bio: String,
                        completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>) -> Void) {
        
        let requestModel = UserData(baseUrl: StringResources.baseURL,
                                    method: .post,
                                    path: StringResources.changeUserData,
                                    userId: userId,
                                    login: userName,
                                    password: password,
                                    email: email,
                                    gender: gender,
                                    creditCard: creditCard,
                                    bio: bio)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
    
    func logout(userId: Int,
                authToken: String,
                completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) {
        
        let requestModel = Logout(baseUrl: StringResources.baseURL,
                                  userId: userId,
                                  authToken: authToken)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
}

extension Auth {
    struct Login: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = StringResources.login
        
        let login: String
        let password: String
        var parameters: Parameters? {
            return [
                "username": login,
                "password": password
            ]
        }
    }
    
    struct UserData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod
        let path: String
        
        let userId: Int
        let login: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        var parameters: Parameters? {
            return [
                "id_user": userId,
                "username": login,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": creditCard,
                "bio": bio
            ]
        }
    }
    
    struct Logout: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = StringResources.logout
        
        let userId: Int
        let authToken: String
        var parameters: Parameters? {
            return [
                "id_user": userId,
                "authToken": authToken
            ]
        }
    }
}

