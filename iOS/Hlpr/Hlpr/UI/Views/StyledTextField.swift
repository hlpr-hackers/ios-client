//
//  StyledTextField.swift
//  Hlpr
//
//  Created by López Torres, Oriol on 2020-04-05.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import UIKit

class StyledTextField: UITextField {
    
    var underline: CALayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addTarget(self, action: #selector(didStartEditing), for: .editingDidBegin)
        addTarget(self, action: #selector(didEndEditing), for: .editingDidEnd)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width = CGFloat(0.5)
        
        if underline == nil {
            underline = CALayer()
            underline?.borderColor = UIConstants.color.contactField.underline
            underline?.borderWidth = width
            self.layer.addSublayer(underline!)
            self.layer.masksToBounds = true
        }
        
        underline?.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width - 10, height: self.frame.size.height)
    }
    
    @objc func didStartEditing() {
        underline?.borderColor = UIConstants.color.contactField.selectedUnderline
    }
    
    @objc func didEndEditing() {
        underline?.borderColor = UIConstants.color.contactField.underline
    }
}
