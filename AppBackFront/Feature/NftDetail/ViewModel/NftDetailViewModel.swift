//
//  NftDetailViewModel.swift
//  AppBackFront
//
//  Created by Haroldo Vinente on 11/05/23.
//

import UIKit

class NftDetailViewModel: NSObject {
    let nft: Nft

    init(nft: Nft) {
        self.nft = nft
    }

    public var numberOfRowsInSection: Int {
        return 1
    }

    public var nftImage: String {
        return nft.nftImage ?? ""
    }
}
