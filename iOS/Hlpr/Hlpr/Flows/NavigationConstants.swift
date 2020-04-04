//
//  NavigationConstants.swift
//  Hlpr
//
//  Created by López Torres, Oriol on 2020-04-04.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import Foundation

struct NavigationConstants {
    struct Segues {
        enum StartViewController: String {
            case navigateToOfferHelp, navigateToGetHelp
        }
        enum RecommendedHelpSeekerViewController: String {
            case navigateToSelectTask
        }
        enum SelectCategoryForProvidingHelpViewController: String {
            case navigateToRecommendedTask
        }
    }
}
