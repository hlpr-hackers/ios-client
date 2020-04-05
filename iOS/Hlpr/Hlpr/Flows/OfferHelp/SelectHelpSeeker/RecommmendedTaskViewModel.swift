//
//  RecommmendedTaskViewModel.swift
//  Hlpr
//
//  Created by Ashwin Rajamohan on 2020-04-05.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import Foundation

class RecommendedTaskViewModel {
    private let repository: TasksRepository
    
    private(set) var seekerName = ""
    private(set) var taskDescription = ""
    
    init(repository: TasksRepository) {
        self.repository = repository
    }
    
    func loadTask(for category: Category, completion: @escaping () -> Void ) {
        repository.retrieveAssignableTasks(for: category) { assignableTasks in
            if let recommendedAssignableTask = assignableTasks.first {
                self.seekerName = recommendedAssignableTask.requestingUser.name
                self.taskDescription = recommendedAssignableTask.task.description
            }
            completion()
        }
    }
}
