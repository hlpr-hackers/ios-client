//
//  CallUtility.swift
//  Hlpr
//
//  Created by Ashwin Rajamohan on 2020-04-05.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import Foundation
import UIKit

class CallUtility {
    private let application: UIApplication
    
    fileprivate init(application: UIApplication) {
        self.application = application
    }
    
    func call(phoneNumber number: String) {
        if let url = URL(string: "tel://\(number)"),
            application.canOpenURL(url) {
                application.open(url)
        }
    }
}

extension Utilities {
    static func calling() -> CallUtility {
        return CallUtility(application: UIApplication.shared)
    }
}
