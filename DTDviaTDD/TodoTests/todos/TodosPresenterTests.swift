//
//  TodosPresenterTests.swift
//  Todo
//
//  Created by Scott Jones on 8/31/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation
import XCTest
@testable import Todo

class TodosPresenterTests: XCTestCase {

    var sut: TodosPresenter!
    var interactor: MockTodosInteractor!
    var router: MockTodosRouter!
    var userInterface: MockTodosUserInterface!

    override func setUp() {
        super.setUp()
        interactor = MockTodosInteractor()
        router = MockTodosRouter()
        userInterface = MockTodosUserInterface()
        sut = TodosPresenter(eventTracker: MockTodoEventTracker())

        sut.interactor = interactor
        sut.router = router
        sut.userInterface = userInterface
    }

    override func tearDown() {
        interactor = nil
        userInterface = nil
        router = nil
        sut = nil
        super.tearDown()
    }

    var stubTodos: [Todo] {
        return [
            Todo(taskName: "create sample app", isCompleted: false),
            Todo(taskName: "write unit tests", isCompleted: false)
        ]
    }

}

extension TodosPresenterTests {

    func test_whenWillAppearCalled_interactorIsToldToFetch() {
        sut.willAppear()

        XCTAssertEqual(1, interactor.fetchTodosCallCount)
    }

    func test_whenTodosAreReturned_UIGetsAViewModel() {
        sut.didFetch(todos: stubTodos)

        XCTAssertEqual(1, userInterface.configureCallCount)
        XCTAssertNotNil(userInterface.configureSpy)
    }

    func test_whenCreateCall_sendToCreateCalledOnRouter() {
        sut.create()

        XCTAssertEqual(1, router.sendToCreateCallCount)
    }

    func test_whenToggleCompletionCalled_interactorRecievesTodo() {
        let todo = Todo(taskName: "toggle", isCompleted: false)

        sut.toggle(todo: todo)

        XCTAssertNotNil(interactor.toggleTodoSpy)
    }

    func test_whenDeleteAll_sendToCreateCalledOnRouter() {
        sut.deleteAll()

        XCTAssertEqual(1, interactor.deleteAllCallCount)
    }

}
