//
//  ViewController.swift
//  Hlpr
//
//  Created by López Torres, Oriol on 2020-04-04.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import UIKit

class StartViewController: StyledViewController {

    @IBOutlet weak var requestHelpView: UIStackView!
    @IBOutlet weak var helpRequestedView: UIView?
    @IBOutlet weak var getHelpButton: ButtonWithImage?
    @IBOutlet weak var offerHelpButton: ButtonWithImage?
    @IBOutlet weak var requestedHelpItem: ButtonWithImage?
    @IBOutlet weak var requestedHelpTitle: UILabel?
    
    var requestHelpRepository: RequestHelpRepository? = {
        return (UIApplication.shared.delegate as? AppDelegate)?.requestHelpRepository
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButtonTargets()
        requestedHelpTitle?.font = UIConstants.font.title
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
        
        /// Should it show the view?
        requestHelpRepository?.getHelp { result in
            let resultValue = try? result.get()
            let helpRequested = resultValue != nil
            self.helpRequestedView?.isHidden = !helpRequested
            self.requestHelpView.isHidden = helpRequested
            
            if let helpRequest = resultValue {
                self.requestedHelpItem?.setTitle(helpRequest.category.name, for: .normal)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        getHelpButton?.layoutIfNeeded()
        offerHelpButton?.layoutIfNeeded()
        requestedHelpItem?.layoutIfNeeded()
        
        getHelpButton?.applyGradient(colours: UIConstants.color.itemGradientColors[0])
        offerHelpButton?.applyGradient(colours: UIConstants.color.itemGradientColors[1])
        requestedHelpItem?.applyGradient(colours: UIConstants.color.itemGradientColors[0])
    }
}



