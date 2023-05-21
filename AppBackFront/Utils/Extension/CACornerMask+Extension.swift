//
//  CACornerMask+Extension.swift
//  AppBackFront
//
//  Created by Haroldo Vinente on 19/05/23.
//

import Foundation
import UIKit

public extension CACornerMask {
    static let bottomRight: CACornerMask = .layerMaxXMaxYCorner
    static let bottomLeft: CACornerMask = .layerMinXMaxYCorner
    static let topRight: CACornerMask = .layerMaxXMinYCorner
    static let topLeft: CACornerMask = .layerMinXMinYCorner
}
