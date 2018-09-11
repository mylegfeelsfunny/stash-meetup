//
//  MockTodosInteractor.swift
//  Todo
//
//  Created by Scott Jones on 8/31/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation
@testable import Todo

class MockTodosInteractor {
    var toggleTodoSpy: Todo?
    var createTodoSpy: Todo?
    var fetchTodosCallCount = 0
    var deleteAllCallCount = 0
    var createCallCount = 0
}

extension MockTodosInteractor: CreateTodosInteractorInput {

    func create(todo: Todo) {
        createCallCount += 1
        createTodoSpy = todo
    }

}

extension MockTodosInteractor: TodosInteractorInput {

    func fetchTodos() {
        fetchTodosCallCount += 1
    }

    func toggle(todo: Todo) {
        toggleTodoSpy = todo
    }

    func deleteAll() {
        deleteAllCallCount += 1
    }

}
