//
//  WalletViewModel.swift
//  AppBackFront
//
//  Created by Haroldo Vinente on 21/05/23.
//

import UIKit

class WalletViewModel {
    private let service: WalletService = .init()

    public func fetch(_ type: TypeFetch) {
        switch type {
            case .mock:
                service.getWalletFromJson { result, failure in
                    print(result)
                }
            case .request:
                service.getWallet { result, failure in
                    print(result)
                }
        }
    }
}
