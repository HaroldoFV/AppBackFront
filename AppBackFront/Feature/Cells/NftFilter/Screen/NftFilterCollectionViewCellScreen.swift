//
//  NftFilterCollectionViewCellScreen.swift
//  AppBackFront
//
//  Created by Haroldo Vinente on 09/05/23.
//

import UIKit

class NftFilterCollectionViewCellScreen: UIView {
    lazy var filterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 18
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configContraints()
    }

    func addViews() {
        addSubview(filterLabel)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configContraints() {
        NSLayoutConstraint.activate([
            filterLabel.topAnchor.constraint(equalTo: topAnchor),
            filterLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            filterLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            filterLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
