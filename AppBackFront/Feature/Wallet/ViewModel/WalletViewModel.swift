//
//  WalletViewModel.swift
//  AppBackFront
//
//  Created by Haroldo Vinente on 21/05/23.
//

import UIKit

protocol WalletViewModelDelegate: AnyObject {
    func success()
    func error()
}

class WalletViewModel {
    private let service: WalletService = .init()
    private weak var delegate: WalletViewModelDelegate?
    private var walletData: WalletData?
    
    public func delegate(delegate: WalletViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetch(_ type: TypeFetch) {
        switch type {
            case .mock:
                service.getWalletFromJson { result, _ in
                    if let result {
                        self.walletData = result
                        self.delegate?.success()
                    } else {
                        self.delegate?.error()
                    }
                }
            case .request:
                service.getWallet { result, _ in
                    if let result {
                        self.walletData = result
                        self.delegate?.success()
                    } else {
                        self.delegate?.error()
                    }
                }
        }
    }
    
    var numberOfRowsInSection: Int {
        return 1
    }
    
    public func loadCurrentQuotationEthereum(indexPath: IndexPath) -> QuotationEthereum {
        return walletData?.quotationEthereum ?? QuotationEthereum()
    }
    
    public func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        switch WalletNameCell(rawValue: indexPath.row) {
            case .quotationEth:
                return 250
            default:
                return 0
        }
    }
}
