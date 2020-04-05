//
//  RecommendedHelpSeekerViewController.swift
//  Hlpr
//
//  Created by Ashwin Rajamohan on 2020-04-04.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import Foundation
import UIKit

class RecommendedHelpSeekerViewController: StyledViewController {
    
    @IBOutlet weak var callNowButton: UIButton?
    @IBOutlet weak var moreTasksButton: UIButton?
    var segueData: RecommendedTaskSegueData?
    private let callUtility = Utilities.calling()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
    
    private func setupButtons() {
        callNowButton?.addTarget(
            self,
            action: #selector(onCallNowButtonPressed),
            for: .touchUpInside
        )
    }
    
    @objc private func onCallNowButtonPressed() {
        callUtility.call(phoneNumber: "123456789")
    }
    
    private func createSegue(
        for button: UIButton,
        segueType: NavigationConstants.Segues.RecommendedHelpSeekerViewController
    ) {
        performSegue(withIdentifier: segueType.rawValue, sender: self)
    }
}
