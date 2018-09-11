//
//  MockTodosPresenter.swift
//  TodoTests
//
//  Created by Scott Jones on 9/3/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation
@testable import Todo

class MockTodosPresenter {
    var willAppearCallCount = 0
    var createCallCount = 0
    var toggleCallCount = 0
    var deleteAllCallCount = 0
    var todoSpy: Todo?
}

extension MockTodosPresenter: TodosPresenterInterface {

    func willAppear() {
        willAppearCallCount += 1
    }

    func create() {
        createCallCount += 1
    }

    func toggle(todo: Todo) {
        toggleCallCount += 1
        todoSpy = todo
    }

    func deleteAll() {
        deleteAllCallCount += 1
    }

}
