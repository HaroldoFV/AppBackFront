//
//  WalletVC.swift
//  AppBackFront
//
//  Created by Haroldo Vinente on 21/05/23.
//

import UIKit

class WalletVC: UIViewController {
    var screen: WalletScreen?
    var viewModel: WalletViewModel = .init()

    override func loadView() {
        screen = WalletScreen()
        view = screen
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetch(.request)
    }
}
