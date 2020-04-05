//
//  UIView+GradientStyling.swift
//  Hlpr
//
//  Created by López Torres, Oriol on 2020-04-05.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import UIKit

extension UIView {
    func applyGradient(colours: [UIColor], locations: [NSNumber]? = nil) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        gradient.cornerRadius = layer.cornerRadius
        self.layer.insertSublayer(gradient, at: 0)
    }
}
