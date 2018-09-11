//
//  MockDatabase.swift
//  TodoTests
//
//  Created by Scott Jones on 8/31/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation
@testable import Todo

class StubTodoDatabase {
    var todoSpy: Todo?
    var stubTodo: Todo!
    var stubToggledTodo: Todo!
    var stubTodos: [Todo] = []
    var saveCallCount = 0
    var fetchTodoCount = 0
    var allTodosCallCount = 0
    var deleteAllTodosCallCount = 0
}

extension StubTodoDatabase: TodoDatabase {

    func save(_ todo: Todo) -> Todo {
        saveCallCount += 1
        todoSpy = todo
        return todo
    }
    func fetchTodo(by taskName: String) -> Todo? {
        fetchTodoCount += 1
        return stubTodo
    }

    func allTodos() -> [Todo] {
        allTodosCallCount += 1
        return stubTodos
    }

    func deleteAllTodos() {
        deleteAllTodosCallCount += 1
    }

}
