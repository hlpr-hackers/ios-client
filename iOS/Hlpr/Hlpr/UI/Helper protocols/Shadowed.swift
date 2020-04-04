//
//  Shadowed.swift
//  Hlpr
//
//  Created by López Torres, Oriol on 2020-04-04.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import UIKit

protocol Shadowed {
    func setUpShadow()
    func updateShadow()
}

extension Shadowed where Self: UIView {
    func setUpShadow() {
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.3
    }
    
    func updateShadow() {
        self.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    }
}

