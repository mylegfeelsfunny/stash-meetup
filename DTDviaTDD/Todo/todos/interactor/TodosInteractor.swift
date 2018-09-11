//
//  TodosInteractor.swift
//  Todo
//
//  Created by Scott Jones on 8/29/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation

class TodosInteractor {

    unowned let database: TodoDatabase
    weak var output: TodosInteractorOutput?

    init(database: TodoDatabase) {
        self.database = database
    }

}

extension TodosInteractor: CreateTodosInteractorInput {

    func create(todo: Todo) {
        let todo = database.save(todo)
        output?.didCreate(todo: todo)
    }

}

extension TodosInteractor: TodosInteractorInput {

    func fetchTodos() {
        let todos = database.allTodos()
        output?.didFetch(todos: todos)
    }

    func toggle(todo: Todo) {
        let toggled = Todo(taskName: todo.taskName, isCompleted: !todo.isCompleted)
        _ = database.save(toggled)
        fetchTodos()
    }

    func deleteAll() {
        database.deleteAllTodos()

        let todos = database.allTodos()
        output?.didFetch(todos: todos)
    }

}
