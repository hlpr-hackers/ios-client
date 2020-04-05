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
        moreTasksButton?.addTarget(
            self,
            action: #selector(onMoreTasksButtonPressed),
            for: .touchUpInside
        )
    }
    
    @objc private func onCallNowButtonPressed() {
        callUtility.call(phoneNumber: "0734637005")
    }
    
    @objc private func onMoreTasksButtonPressed() {
        performSegue(
            withIdentifier: NavigationConstants.Segues.RecommendedHelpSeekerViewController.navigateToSelectTask.rawValue,
            sender: self)
    }
}
