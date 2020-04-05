//
//  TasksRepository.swift
//  Hlpr
//
//  Created by Ashwin Rajamohan on 2020-04-05.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import Foundation

protocol TasksRepository {
    func retrieveAssignableTasks(completion: @escaping ([AssignableTask]) -> Void)
}

class TasksRepositoryImpl : TasksRepository {
    func retrieveAssignableTasks(completion: @escaping ([AssignableTask]) -> Void) {
        completion([
            AssignableTask(task: Task(id: "1", name: "Test", description: "Description"), requestingUser: HelpSeeker(id: "id", name: "Ashley", phoneNumber: "07312345"))
        ])
    }
}
