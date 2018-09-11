//
//  CreateTodoInterface.swift
//  Todo
//
//  Created by Scott Jones on 8/31/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation

protocol CreateTodoUserInterface: class {
    func configure()
}

protocol CreateTodoPresenterInterface: class {
    func didLoad()
    func dismiss()
    func createTodo(with taskName: String)
}

protocol CreateTodoRouterInterface: class {
    func dismiss()
}

protocol CreateTodosInteractorInput {
    func create(todo: Todo)
}

protocol CreateTodoEventTracking {
    func sendDidLoadEvent()
    func sendDidCreateEvent(todo: Todo)
    func dismiss()
}
