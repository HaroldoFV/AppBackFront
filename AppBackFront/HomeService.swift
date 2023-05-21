//
//  HomeService.swift
//  AppBackFront
//
//  Created by Haroldo Vinente on 06/05/23.
//

import UIKit
import Alamofire

protocol HomeServiceDelegate: GenericService {
    func getHomeFromJson(completion: @escaping completion<NFTData?>)
    func getHome(completion: @escaping completion<NFTData?>)
}

class HomeService: HomeServiceDelegate {
    func getHome(completion: @escaping completion<NFTData?>) {
        let url = "https://run.mocky.io/v3/3062ce93-f287-4f07-89f6-5d912270d573"

        AF.request(url, method: .get).validate(statusCode: 200 ... 299).responseDecodable(of: NFTData.self) { response in
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

    func getHomeFromJson(completion: @escaping completion<NFTData?>) {
        if let url = Bundle.main.url(forResource: "HomeData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let nftData: NFTData = try JSONDecoder().decode(NFTData.self, from: data)
                completion(nftData,nil)
            } catch {
                completion(nil, Error.fileDecodingFailed(name: "HomeData", error))
            }
        } else {
            completion(nil, Error.fileNotFound(name: "HomeData"))
        }
    }
}
