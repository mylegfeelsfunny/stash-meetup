//
//  CreateTodoPresenter.swift
//  Todo
//
//  Created by Scott Jones on 8/31/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation

class CreateTodoPresenter {
    weak var userInterface: CreateTodoUserInterface?
    var interactor: CreateTodosInteractorInput?
    var router: CreateTodoRouterInterface?
    let eventTracker: CreateTodoEventTracking

    init(eventTracker: CreateTodoEventTracking) {
        self.eventTracker = eventTracker
    }

    private func configureView() {
        userInterface?.configure()
    }
}

extension CreateTodoPresenter: CreateTodoPresenterInterface {

    func didLoad() {
        eventTracker.sendDidLoadEvent()
        configureView()
    }

    func dismiss() {
        eventTracker.dismiss()
        router?.dismiss()
    }

    func createTodo(with taskName: String) {
        interactor?.create(todo: Todo(taskName: taskName))
    }

}

extension CreateTodoPresenter: TodosInteractorOutput {

    func didCreate(todo: Todo) {
        eventTracker.sendDidCreateEvent(todo: todo)
        router?.dismiss()
    }

}
