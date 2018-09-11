//
//  MockCreateTodoPresenter.swift
//  TodoTests
//
//  Created by Scott Jones on 9/3/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation
@testable import Todo

class MockCreateTodoPresenter {
    var didLoadCount = 0
    var createTodoCallCount = 0
    var createTaskNameSpy: String?
    var dismissCallCount = 0
}

extension MockCreateTodoPresenter: CreateTodoPresenterInterface {

    func didLoad() {
        didLoadCount += 1
    }

    func dismiss() {
        dismissCallCount += 1
    }

    func createTodo(with taskName: String) {
        createTodoCallCount += 1
        createTaskNameSpy = taskName
    }

}
