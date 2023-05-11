//
//  NftTableViewCell.swift
//  AppBackFront
//
//  Created by Haroldo Vinente on 10/05/23.
//

import UIKit

class NftTableViewCell: UITableViewCell {
    static let identifier: String = .init(describing: NftTableViewCell.self)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
