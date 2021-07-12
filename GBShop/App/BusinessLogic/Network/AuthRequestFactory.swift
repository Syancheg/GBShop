//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Константин Кузнецов on 28.06.2021.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String,
               password: String,
               completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
    
    func register(userId: Int,
                  userName: String,
                  password: String,
                  email: String,
                  gender: String,
                  creditCard: String,
                  bio: String,
                  completionHandler: @escaping (AFDataResponse<RegisterResult>) -> Void)
    
    func changeUserData(userId: Int,
                        userName: String,
                        password: String,
                        email: String,
                        gender: String,
                        creditCard: String,
                        bio: String,
                        completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>) -> Void)
    
    func logout(userId: Int,
                authToken: String,
                completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
    
}

