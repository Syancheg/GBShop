//
//  AbstractErrorParser.swift
//  GBShop
//
//  Created by Константин Кузнецов on 28.06.2021.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
