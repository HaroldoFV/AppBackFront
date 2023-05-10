//
//  HomeViewModel.swift
//  AppBackFront
//
//  Created by Haroldo Vinente on 06/05/23.
//
import UIKit

protocol HomeViewModelDelegate: AnyObject {
    func success()
    func error()
}

class HomeViewModel {
    private let service: HomeService = .init()
    private var nftData: NFTData?
    private weak var delegate: HomeViewModelDelegate?
    
    public func delegate(delegate: HomeViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetchRequest(_ typeFetch: TypeFetch) {
        switch typeFetch {
            case .mock:
                service.getHomeFromJson { result, failure in
                    if let result {
                        self.nftData = result
                        self.delegate?.success()
                    } else {
                        print(failure as Any)
                        self.delegate?.error()
                    }
                }
            case .request:
                service.getHome { result, failure in
                    if let result {
                        self.nftData = result
                        self.delegate?.success()
                    } else {
                        print(failure as Any)
                        self.delegate?.error()
                    }
                }
        }
    }
    
    // MARK: - FilterCollectionView
    
    var numberOfItemsInSection: Int {
        return nftData?.filterListNft?.count ?? 0
    }
    
    func loadCurrentFilterNft(indexPath: IndexPath) -> FilterNft {
        return nftData?.filterListNft?[indexPath.row] ?? FilterNft()
    }
    
    var sizeForItemAt: CGSize {
        return CGSize(width: 100, height: 34)
    }
}
