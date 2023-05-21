//
//  WalletService.swift
//  AppBackFront
//
//  Created by Haroldo Vinente on 21/05/23.
//

import Alamofire
import UIKit

protocol WalletServiceDelegate: GenericService {
    func getWalletFromJson(completion: @escaping completion<WalletData?>)
    func getWallet(completion: @escaping completion<WalletData?>)
}

class WalletService: WalletServiceDelegate {
    func getWallet(completion: @escaping completion<WalletData?>) {
        let url = "https://run.mocky.io/v3/9865d3fa-ea37-466d-8a6a-84b464962e36"

        AF.request(url, method: .get).validate(statusCode: 200 ... 299).responseDecodable(of: WalletData.self) { response in
            debugPrint(response)
            switch response.result {
                case .success(let success):
                    print("SUCCESS -> \(#function)")
                    completion(success, nil)
                case .failure(let error):
                    print("ERROR -> \(#function)")
                    completion(nil, Error.errorRequest(error))
            }
        }
    }

    func getWalletFromJson(completion: @escaping completion<WalletData?>) {
        if let url = Bundle.main.url(forResource: "WalletData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let result: WalletData = try JSONDecoder().decode(WalletData.self, from: data)
                completion(result, nil)
            } catch {
                completion(nil, Error.fileDecodingFailed(name: "WalletData", error))
            }
        } else {
            completion(nil, Error.fileNotFound(name: "WalletData"))
        }
    }
}
