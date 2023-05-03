//
//  AlertController.swift
//  AppBackFront
//
//  Created by Haroldo Vinente on 02/05/23.
//

import UIKit

class AlertController: NSObject {
    var controller: UIViewController

    init(controller: UIViewController) {
        self.controller = controller
    }

    func getAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel) { _ in
            completion?()
        }
        alertController.addAction(ok)
        self.controller.present(alertController, animated: true)
    }
}
