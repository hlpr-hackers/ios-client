//
//  SelectTaskViewModel.swift
//  Hlpr
//
//  Created by Ashwin Rajamohan on 2020-04-05.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import Foundation

class SelectTaskViewModel {
    private let repository: TasksRepository
    
    init(repository: TasksRepository) {
        self.repository = repository
    }
    
    func loadAssignableTasks(completion: @escaping ([AssignableTask]) -> Void) {
        ///TODO
    }
}
