//
//  ConfirmationViewController.swift
//  Hlpr
//
//  Created by López Torres, Oriol on 2020-04-05.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import UIKit

class ConfirmationViewController: StyledViewController {
    
    @IBAction func didConfirm(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
