//
//  ViewController.swift
//  Hlpr
//
//  Created by López Torres, Oriol on 2020-04-04.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var getHelpButton: ButtonWithImage?
    @IBOutlet weak var offerHelpButton: ButtonWithImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtonTargets()
    }

    func setUpButtonTargets() {
        getHelpButton?.addTarget(self, action: #selector(getHelpButtonPressed), for: .touchUpInside)
        offerHelpButton?.addTarget(self, action: #selector(offerHelpButtonPressed), for: .touchUpInside)
    }
    
    @objc func getHelpButtonPressed() {
        performSegue(withIdentifier: NavigationConstants.Segues.StartViewController.navigateToGetHelp.rawValue,
                     sender: self)
    }
    
    @objc func offerHelpButtonPressed() {
        performSegue(withIdentifier: NavigationConstants.Segues.StartViewController.navigateToOfferHelp.rawValue,
                     sender: self)
    }
    
    /// Hide navigation bar only for this view controller
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}



