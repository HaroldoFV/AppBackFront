//
//  UIView+Extension.swift
//  AppBackFront
//
//  Created by Haroldo Vinente on 19/05/23.
//
import Foundation
import UIKit

extension UIView {
    func roundCorners(cornerRadiuns: Double, typeCorners: CACornerMask) {
        self.layer.cornerRadius = CGFloat(cornerRadiuns)
        self.clipsToBounds = true
        self.layer.maskedCorners = typeCorners
    }
}
