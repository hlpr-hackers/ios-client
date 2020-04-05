//
//  SelectTaskViewController.swift
//  Hlpr
//
//  Created by Ashwin Rajamohan on 2020-04-04.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import Foundation
import UIKit

class SelectTaskViewController: StyledViewController {
    private let viewModel = RepositoryFactory.createTasksRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
