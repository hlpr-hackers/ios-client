//
//  ButtonWithImage.swift
//  Hlpr
//
//  Created by López Torres, Oriol on 2020-04-04.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import UIKit

class ButtonWithImage: UIButton {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpStyle()
    }
    
    func setUpStyle() {
        self.backgroundColor = UIConstants.color.itemBackgroundColor
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.3
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setShadow()
    }
    
    private func setShadow() {
        self.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    }
}
