//
//  GenericService.swift
//  AppBackFront
//
//  Created by Haroldo Vinente on 06/05/23.
//

import Alamofire
import Foundation

enum Error: Swift.Error {
    case fileNotFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
    case errorRequest(AFError)
}

protocol GenericService: AnyObject {
    typealias completion<T> = (_ result: T, _ failure: Error?) -> Void
}
