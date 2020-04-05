//
//  RespositoryFactory.swift
//  Hlpr
//
//  Created by Ashwin Rajamohan on 2020-04-05.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import Foundation

class RepositoryFactory {
    static func createTasksRepository() -> TasksRepository {
        return TasksRepositoryImpl()
    }
}
