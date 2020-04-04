//
//  Category.swift
//  Hlpr
//
//  Created by López Torres, Oriol on 2020-04-04.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import Foundation

enum Relevance {
    case high, normal
}

struct Category {
    let id: String
    let name: String
    let relevance: Relevance
}

extension Category: Hashable {}
