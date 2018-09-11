//
//  TodosPresenter.swift
//  Todo
//
//  Created by Scott Jones on 8/29/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation

class TodosPresenter {
    weak var userInterface: TodosUserInterface?
    var interactor: TodosInteractorInput?
    var router: TodosRouterInterface?
    let eventTracker: TodoEventTracking

    init(eventTracker: TodoEventTracking) {
        self.eventTracker = eventTracker
    }

}

extension TodosPresenter: TodosPresenterInterface {

    func willAppear() {
        eventTracker.sendDidAppearEvent()
        interactor?.fetchTodos()
    }

    func create() {
        router?.sendToCreate()
    }

    func toggle(todo: Todo) {
        eventTracker.sendToggleEvent(todo: todo)
        interactor?.toggle(todo: todo)
    }

    func deleteAll() {
        eventTracker.sendDeleteAll()
        interactor?.deleteAll()
    }

}

extension TodosPresenter: TodosInteractorOutput {

    func didFetch(todos: [Todo]) {
        userInterface?.configure(with: .viewModel(todos: todos))
    }

}
