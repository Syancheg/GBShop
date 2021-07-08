//
//  ViewController.swift
//  GBShop
//
//  Created by Константин Кузнецов on 24.06.2021.
//

import UIKit

class ViewController: UIViewController {

    
    let requestFactory = RequestFactory()
    var auth: AuthRequestFactory?
    var product: ProductRequestFactory?
    var reviews: ReviewRequestFactory?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        auth = requestFactory.makeAuthRequestFatory()
        product = requestFactory.makeProductRequaetFactory()
        reviews = requestFactory.makeReviewRequaetFactory()
        register()
        login()
        changeUserData()
        logout()
        getProduct()
        getProducts()
        addReview()
        removeReview()
        getReviews()
    }
    
    func register() {
        
        auth?.register(userId: 123,
                       userName: "Somebody",
                       password: "mypassword",
                       email: "some@some.ru",
                       gender: "m",
                       creditCard: "9872389-2424-234224-234",
                       bio: "This is good! I think I will switch to another language") { (response) in
            switch response.result {
            case .success(let success):
                print(success)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func login() {
        
        auth?.login(userName: "Somebody",
                    password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func changeUserData() {
        
        auth?.changeUserData(userId: 123,
                             userName: "Somebody",
                             password: "mypassword",
                             email: "some@some.ru",
                             gender: "m",
                             creditCard: "9872389-2424-234224-234",
                             bio: "This is good! I think I will switch to another language") { (response) in
            switch response.result {
            case .success(let success):
                print(success)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func logout() {
        
        auth?.logout(userId: 123,
                     authToken: "token") { (response) in
            switch response.result {
            case .success(let success):
                print(success)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getProduct(){
        
        product?.getProduct(id: 123,
                            oauthToken: "token",
                            completionHandler: { (response) in
                                switch response.result {
                                case .success(let success):
                                    print(success)
                                case .failure(let error):
                                    print(error.localizedDescription)
                                }
                            })
    }
    
    func getProducts(){
        
        product?.getProducts(oauthToken: "token",
                             nextPageToken: "",
                             prevPageToken: "",
                             limit: 20,
                             offset: 0,
                             completionHandler: { (response) in
                                switch response.result {
                                case .success(let success):
                                    print(success)
                                case .failure(let error):
                                    print(error.localizedDescription)
                                }
                             })
    }
    
    func getReviews() {
        
        reviews?.getReviews(nextPageToken: "",
                            prevPageToken: "",
                            limit: 5,
                            offset: 0,
                            completionHandler: { (response) in
                                switch response.result {
                                case .success(let success):
                                    print(success)
                                case .failure(let error):
                                    print(error.localizedDescription)
                                }
                            })
    }
    
    func addReview() {
        
        reviews?.addReview(rating: 5,
                           userName: "Konstantin",
                           email: "artopus@list.ru",
                           dignities: "",
                           disadvantages: "",
                           comment: "Gooood work!",
                           completionHandler: { (response) in
                            switch response.result {
                            case .success(let success):
                                print(success)
                            case .failure(let error):
                                print(error.localizedDescription)
                            }
                           })
    }
    
    func removeReview() {
        
        reviews?.removeReview(id: 3,
                              completionHandler: { (response) in
                                switch response.result {
                                case .success(let success):
                                    print(success)
                                case .failure(let error):
                                    print(error.localizedDescription)
                                }
                              })
    }


}

