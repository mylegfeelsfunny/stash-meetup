//
//  MockTodosInteractorOutput.swift
//  Todo
//
//  Created by Scott Jones on 8/31/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation
@testable import Todo

class MockTodosInteractorOutput {
    var didFetchCallCount = 0
    var didCreateCallCount = 0
    var fetchedTodosSpy: [Todo] = []
    var fetchedTodoSpy: Todo?
}

extension MockTodosInteractorOutput: TodosInteractorOutput {

    func didFetch(todos: [Todo]) {
        didFetchCallCount += 1
        fetchedTodosSpy = todos
    }

    func didCreate(todo: Todo) {
        didCreateCallCount += 1
        fetchedTodoSpy = todo
    }

}
