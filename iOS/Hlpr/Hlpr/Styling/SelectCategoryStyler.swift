//
//  SelectCategoryStyler.swift
//  Hlpr
//
//  Created by López Torres, Oriol on 2020-04-04.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import UIKit

class SelectCategoryStyler {
    
    var view: UIView
    
    /// Elements to style
    private(set) var categoryGroupView: CategoryGroupView?
    
    init(view: UIView) {
        self.view = view
    }
    
    func style(with categories: [Category],
               title: String) {
        let scrollView = setUpScrollView(in: &view)
        let contentStackView = setUpContentStackView(into: scrollView)

        /// Title label
        let titleLabel = setUpTitleLabel(title: title)
        contentStackView.addArrangedSubview(titleLabel)
        
        /// Category group
        self.categoryGroupView = setUpCategoryGroupView(with: categories)
        contentStackView.addArrangedSubview(categoryGroupView!)
    }
    
    @discardableResult
    private func setUpScrollView(in view: inout UIView) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        scrollView.delaysContentTouches = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        return scrollView
    }
    
    @discardableResult
    private func setUpContentStackView(into scrollView: UIScrollView) -> UIStackView {
        let contentStackView = UIStackView()
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.axis = .vertical
        contentStackView.layoutMargins = UIEdgeInsets(top: UIConstants.spacing.padding,
                                                      left: UIConstants.spacing.padding,
                                                      bottom: 0,
                                                      right: UIConstants.spacing.padding)
        contentStackView.isLayoutMarginsRelativeArrangement = true
        contentStackView.spacing = UIConstants.spacing.padding

        
        scrollView.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        return contentStackView
    }
    
    @discardableResult
    private func setUpTitleLabel(title: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.text = title
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    @discardableResult
    private func setUpCategoryGroupView(with categories: [Category]) -> CategoryGroupView {
        let categoryGroupView = CategoryGroupView()
        categoryGroupView.translatesAutoresizingMaskIntoConstraints = false
        categoryGroupView.categories = categories
        return categoryGroupView
    }

}
