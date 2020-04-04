//
//  StyledViewController.swift
//  Hlpr
//
//  Created by López Torres, Oriol on 2020-04-04.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import UIKit

class StyledViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStyle()
        setUpNavigationBarStyle()
    }
    
    private func setUpStyle() {
        view.backgroundColor = UIConstants.color.backgroundColor
    }
    
    private func setUpNavigationBarStyle() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }
}
