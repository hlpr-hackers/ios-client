//
//  UIConstants.swift
//  Hlpr
//
//  Created by López Torres, Oriol on 2020-04-04.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import UIKit

struct UIConstants {
    struct spacing {
        static let padding = CGFloat(20.0)
    }
    struct color {
        static let backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        static let itemBackgroundColors: [UIColor] = [UIColor.white]
        static let itemGradientColors: [[UIColor]] = [
            [UIColor(red: 250.0/255.0, green: 104.0/255.0, blue: 94.0/255.0, alpha: 1.0), UIColor(red: 216.0/255.0, green: 143.0/255.0, blue: 251.0/255.0, alpha: 1.0)],
            [UIColor(red: 25.0/255.0, green: 159.0/255.0, blue: 252.0/255.0, alpha: 1.0), UIColor(red: 126.0/255.0, green: 248.0/255.0, blue: 216.0/255.0, alpha: 1.0)],
            [UIColor(red: 252.0/255.0, green: 137.0/255.0, blue: 132.0/255.0, alpha: 1.0), UIColor(red: 250.0/255.0, green: 156.0/255.0, blue: 25.0/255.0, alpha: 1.0)],
            [UIColor(red: 215.0/255.0, green: 249.0/255.0, blue: 128.0/255.0, alpha: 1.0), UIColor(red: 250.0/255.0, green: 156.0/255.0, blue: 25.0/255.0, alpha: 1.0)],
            [UIColor(red: 252.0/255.0, green: 146.0/255.0, blue: 217.0/255.0, alpha: 1.0), UIColor(red: 132.0/255.0, green: 139.0/255.0, blue: 250.0/255.0, alpha: 1.0)]
        ]
        static let tintColor = UIColor(red: 0.0/255.0, green: 165.0/255.0, blue: 227.0/255.0, alpha: 1.0)
        static let disabled = UIConstants.color.tintColor.withAlphaComponent(0.4)
/// Possible scale of colors
        
//        static let itemBackgroundColors: [UIColor] = [
//            UIColor(red: 0.0/255.0, green: 165.0/255.0, blue: 227.0/255.0, alpha: 1.0),
//            UIColor(red: 141.0/255.0, green: 215.0/255.0, blue: 191.0/255.0, alpha: 1.0),
//            UIColor(red: 255.0/255.0, green: 150.0/255.0, blue: 197.0/255.0, alpha: 1.0),
//            UIColor(red: 255.0/255.0, green: 87.0/255.0, blue: 104.0/255.0, alpha: 1.0),
//            UIColor(red: 255.0/255.0, green: 191.0/255.0, blue: 101.0/255.0, alpha: 1.0),
//            UIColor(red: 252.0/255.0, green: 98.0/255.0, blue: 56.0/255.0, alpha: 1.0),
//            UIColor(red: 255.0/255.0, green: 216.0/255.0, blue: 114.0/255.0, alpha: 1.0),
//            UIColor(red: 242.0/255.0, green: 212.0/255.0, blue: 204.0/255.0, alpha: 1.0),
//            UIColor(red: 231.0/255.0, green: 117.0/255.0, blue: 119.0/255.0, alpha: 1.0),
//            UIColor(red: 108.0/255.0, green: 136.0/255.0, blue: 196.0/255.0, alpha: 1.0),
//            UIColor(red: 192.0/255.0, green: 87.0/255.0, blue: 128.0/255.0, alpha: 1.0),
//            UIColor(red: 255.0/255.0, green: 130.0/255.0, blue: 139.0/255.0, alpha: 1.0),
//            UIColor(red: 231.0/255.0, green: 197.0/255.0, blue: 130.0/255.0, alpha: 1.0),
//            UIColor(red: 0.0/255.0, green: 176.0/255.0, blue: 186.0/255.0, alpha: 1.0),
//        ]
        
        static let button: UIColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        static let buttonHighlighted = UIConstants.color.button.withAlphaComponent(0.5)
        static let error = UIColor(red: 255.0/255.0, green: 57.0/255.0, blue: 57.0/255.0, alpha: 1.0)
        
        struct contactField {
            static let underline = UIColor.lightGray.cgColor
            static let selectedUnderline = UIColor.blue.cgColor
            static let errorUnderline = UIColor.red.cgColor
        }
    }
    
    struct button {
        static let radius = CGFloat(5.0)
        static let minimumHeight = CGFloat(80.0)
    }
    
    struct font {
        static let title = UIFont.boldSystemFont(ofSize: 30.0)
    }
}
