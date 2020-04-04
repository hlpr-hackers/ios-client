//
//  HorizontalCategoryView.swift
//  Hlpr
//
//  Created by López Torres, Oriol on 2020-04-04.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import UIKit

class HorizontalCategoryView: UIStackView {
    
    weak var delegate: CategoryViewDelegate?
    
    init(categories: [Category]) {
        assert(categories.count > 0, "There should be at least one category to create a horizontal category view")
        
        super.init(frame: .zero)
        
        axis = .horizontal
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
        spacing = UIConstants.spacing.padding

        /// Set constraints
        for category in categories {
            let categoryView = CategoryView(category: category)
            categoryView.delegate = self
            addArrangedSubview(categoryView)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HorizontalCategoryView: CategoryViewDelegate {
    func didSelectItem(forCategory category: Category) {
        delegate?.didSelectItem(forCategory: category)
    }
}
