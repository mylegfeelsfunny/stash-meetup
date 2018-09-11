//
//  TodosInterface.swift
//  Todo
//
//  Created by Scott Jones on 8/29/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation

protocol TodosUserInterface: class {
    func configure(with viewModel: TodosViewModel)
}

protocol TodosPresenterInterface: class {
    func willAppear()
    func create()
    func toggle(todo: Todo)
    func deleteAll()
}

protocol TodosInteractorInput {
    func fetchTodos()
    func toggle(todo: Todo)
    func deleteAll()
}

protocol TodosInteractorOutput: class {
    func didCreate(todo: Todo)
    func didFetch(todos: [Todo])
}
extension TodosInteractorOutput {
    func didCreate(todo: Todo) {}
    func didFetch(todos: [Todo]) {}
}

protocol TodosRouterInterface: class {
    func sendToCreate()
}

protocol TodoEventTracking {
    func sendDidAppearEvent()
    func sendToggleEvent(todo: Todo)
    func sendDeleteAll()
}
