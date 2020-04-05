//
//  CategoryView.swift
//  Hlpr
//
//  Created by López Torres, Oriol on 2020-04-04.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import UIKit

protocol CategoryViewDelegate: class {
    func didSelectItem(forCategory category: Category)
}

class CategoryView: ButtonWithImage {
    
    /// Objects
    var category: Category!
    weak var delegate: CategoryViewDelegate?
    
    /// Modifiers
    var title: String? {
        didSet {
            setTitle(title, for: .normal)
        }
    }
    
    var image: UIImage? {
        didSet {
            setImage(image, for: .normal)
        }
    }
    
    /// Initialization
    
    init(category: Category) {
        super.init(frame: .zero)
        
        configure(for: category)
        let colorId = Int(category.id)!%UIConstants.color.itemBackgroundColors.count /// TODO: Remove force unwrap
        self.backgroundColor = UIConstants.color.itemBackgroundColors[colorId]
        
        setUpShadow()
        
        addTarget(self, action: #selector(didPressButton), for: .touchUpInside)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(for category: Category) {
        self.category = category
        self.title = category.name
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateShadow()
    }
    
    /// Targets
    @objc func didPressButton() {
        delegate?.didSelectItem(forCategory: category)
    }
}
