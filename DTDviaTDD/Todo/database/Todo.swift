//
//  Todo.swift
//  Todo
//
//  Created by Scott Jones on 8/31/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation

struct Todo {
    let taskName: String
    let isCompleted: Bool

    init(taskName: String, isCompleted: Bool = false) {
        self.taskName = taskName
        self.isCompleted = isCompleted
    }

}

extension Todo: Equatable {
    static func == (lhs: Todo, rhs: Todo) -> Bool {
        return lhs.taskName == rhs.taskName && lhs.isCompleted == rhs.isCompleted
    }
}
