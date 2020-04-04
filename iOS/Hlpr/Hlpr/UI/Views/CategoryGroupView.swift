//
//  CategoryGroupView.swift
//  Hlpr
//
//  Created by López Torres, Oriol on 2020-04-04.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import UIKit

class CategoryGroupView: UIView {
    
    var stackView: UIStackView!
    
    var categories: [Category] = [] {
        didSet {
            didUpdateCategories(to: categories)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stackView = UIStackView()
        
        self.addSubview(stackView)
        
        configure(stackView: stackView)
        
        /// Set constraints
        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Set up views
    func configure(stackView: UIStackView) {
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = UIConstants.spacing.padding
    }
    
    func didUpdateCategories(to categories: [Category]) {
        var registeredCategories = Set<Category>()
        for i in 0..<categories.count where !registeredCategories.contains(categories[i]) {
            let category = categories[i]
            registeredCategories.insert(category)

            if category.relevance == .normal, let nextNormalRelevanceCategory = categories.first(where: { category -> Bool in
                category.relevance == .normal && !registeredCategories.contains(category)
            }) {
                add(categories: [category, nextNormalRelevanceCategory], into: &stackView)

                /// There is another item with relevance
                registeredCategories.insert(nextNormalRelevanceCategory)
            } else {
                add(categories: [category], into: &stackView)
            }
        }
    }
    
    private func add(categories: [Category], into stackView: inout UIStackView) {
        guard categories.count > 0 else {
            return
        }
        if categories.count > 1 {
            let horizontalCategoryView = HorizontalCategoryView(categories: categories)
            stackView.addArrangedSubview(horizontalCategoryView)
        } else {
            let categoryView = CategoryView(category: categories[0])
            stackView.addArrangedSubview(categoryView)
        }
    }
}
