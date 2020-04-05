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
        setUpShadow()
        
        layer.cornerRadius = UIConstants.button.radius
        
        setTitleColor(UIConstants.color.button, for: .normal)
        setTitleColor(UIConstants.color.buttonHighlighted, for: .highlighted)
        titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        titleLabel?.shadowOffset = CGSize(width: 0.3, height: 0.3)
        titleLabel?.layer.shadowRadius = 2.0
        setTitleShadowColor(UIColor.darkGray, for: .normal)
                
        NSLayoutConstraint.activate([
            heightAnchor.constraint(greaterThanOrEqualToConstant: UIConstants.button.minimumHeight)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateShadow()
    }
}
