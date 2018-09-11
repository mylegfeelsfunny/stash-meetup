//
//  CreateTodoPresenterTests.swift
//  Todo
//
//  Created by Scott Jones on 9/1/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation
import XCTest
@testable import Todo

class CreateTodoPresenterTests: XCTestCase {

    var sut: CreateTodoPresenter!
    var interactor: MockTodosInteractor!
    var router: MockCreateTodoRouter!
    var userInterface: MockCreateTodoUserInterface!

    override func setUp() {
        super.setUp()
        interactor = MockTodosInteractor()
        router = MockCreateTodoRouter()
        userInterface = MockCreateTodoUserInterface()
        sut = CreateTodoPresenter(eventTracker: MockTodoEventTracker())

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
}

extension CreateTodoPresenterTests {

    func test_whenViewIsLoaded_didLoadIsCalled() {
        sut.didLoad()

        XCTAssertEqual(1, userInterface.configureCallCount)
    }

    func test_whenDismisIsCalled_routerDimissIsCalled() {
        sut.dismiss()

        XCTAssertEqual(1, router.dismissCallCount)
    }

    func test_whenCreateTodoCalled_InteractorCreateTodoCalled() {
        let textFieldText = "Complete TDDing Test Application"
        sut.createTodo(with: textFieldText)

        XCTAssertEqual(1, interactor.createCallCount)
        XCTAssertEqual(textFieldText, interactor.createTodoSpy?.taskName)
    }

    func test_whenTodoCompleted_routerDimissIsCalled() {
        sut.didCreate(todo: Todo(taskName: "Complete TDDing Test Application"))

        XCTAssertEqual(1, router.dismissCallCount)
    }

}
