//
//  SelectCategoryForGettingHelpViewController.swift
//  Hlpr
//
//  Created by López Torres, Oriol on 2020-04-04.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import UIKit

class SelectCategoryForGettingHelpViewController: StyledViewController {
    let categories: [Category] = {
        /// TODO: Fetch from API
        return [
            Category(id: "1", name: "Pick up groceries", relevance: .high),
            Category(id: "2", name: "Throw the garbage", relevance: .normal),
            Category(id: "3", name: "Buy groceries", relevance: .high),
            Category(id: "4", name: "Send a letter", relevance: .normal),
            Category(id: "5", name: "Other", relevance: .normal)
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let title = "I need help"
        let styler = SelectCategoryStyler(view: view)
        styler.style(with: categories, title: title)
        
        styler.categoryGroupView?.delegate = self
    }
}

extension SelectCategoryForGettingHelpViewController: CategoryViewDelegate {
    func didSelectItem(forCategory category: Category) {
        let requestHelp = RequestHelp(category: category,
                                      contactInformation: nil)
        let viewController = AddContactInformationViewController(requestHelp: requestHelp)
        navigationController?.show(viewController, sender: self)
    }
}
