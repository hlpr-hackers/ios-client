//
//  ButtonWithImage.swift
//  Hlpr
//
//  Created by López Torres, Oriol on 2020-04-04.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import UIKit

class ButtonWithImage: UIButton, Shadowed {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpStyle()
    }
    
    func setUpStyle() {
        let colorId = Int.random(in: 0..<UIConstants.color.itemBackgroundColors.count)
        self.backgroundColor = UIConstants.color.itemBackgroundColors[colorId]
        setUpShadow()
        
        layer.cornerRadius = UIConstants.button.radius
        
        setTitleColor(UIConstants.color.button, for: .normal)
        setTitleColor(UIConstants.color.buttonHighlighted, for: .highlighted)
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(greaterThanOrEqualToConstant: UIConstants.button.minimumHeight)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateShadow()
    }
}
