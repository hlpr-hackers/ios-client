//
//  TasksRepository.swift
//  Hlpr
//
//  Created by Ashwin Rajamohan on 2020-04-05.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import Foundation

protocol TasksRepository {
    func retrieveAssignableTasks(for category: Category, completion: @escaping ([AssignableTask]) -> Void)
}

class TasksRepositoryImpl : TasksRepository {
    func retrieveAssignableTasks(for category: Category, completion: @escaping ([AssignableTask]) -> Void) {
        completion(createMockTasks())
    }
    
    private func createMockTasks() -> [AssignableTask] {
        var tasks: [AssignableTask] = []
        let names = ["Oriol", "Carolina", "Ashwin"]
        let baseAge = 60
        for taskNumber in (0...names.count - 1) {
            let requestingUser = HelpSeeker(
                id: "\(taskNumber)",
                name: names[taskNumber],
                age: baseAge + taskNumber,
                phoneNumber: "073123445\(taskNumber)"
            )
            let task = Task(
                id: "\(taskNumber)",
                name: "Task\(taskNumber)",
                description: "Please help me get my grocery shopping done :)"
            )
            tasks.append(AssignableTask(task: task, requestingUser: requestingUser))
        }
        return tasks
    }
}
