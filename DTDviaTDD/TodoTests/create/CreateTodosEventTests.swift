//
//  CreateTodosEventTests.swift
//  TodoTests
//
//  Created by Scott Jones on 9/5/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import XCTest
@testable import Todo

class CreateTodosEventTests: XCTestCase {
    
    var todoEventTracker: TodoEventTracker!
    var eventTracker: MockEventTracker!
    var presenter: CreateTodoPresenter!

    override func setUp() {
        super.setUp()
        eventTracker = MockEventTracker()
        todoEventTracker = TodoEventTracker(eventTracker: eventTracker)
    }

    override func tearDown() {
        eventTracker = nil
        presenter = nil
        todoEventTracker = nil
        super.tearDown()
    }

    func test_didLoad_sendsCreateTodoScreenNameEvent() {
        // given
        presenter = CreateTodoPresenter(eventTracker: todoEventTracker)

        // when
        presenter.didLoad()

        // then
        let expectedEvents: [TestEvent] = [.with("Todo", ["ScreenName": "CreateTodo"])]
        XCTAssertEventsEqual(expectedEvents, eventTracker.events)
    }

    func test_didCreate_sendsDidCreateTodoEvent() {
        // given
        presenter = CreateTodoPresenter(eventTracker: todoEventTracker)

        // when
        let todo = Todo(taskName: "test creating todo", isCompleted: false)
        presenter.didCreate(todo: todo)

        // then
        let expectedEvents: [TestEvent] = [.with("Todo", ["Action": "DidCreate", "TaskName": "test creating todo"])]
        XCTAssertEventsEqual(expectedEvents, eventTracker.events)
    }

    func test_dismiss_sendsDismisActionEvent() {
        // given
        presenter = CreateTodoPresenter(eventTracker: todoEventTracker)

        // when
        presenter.dismiss()

        // then
        let expectedEvents: [TestEvent] = [.with("Todo", ["ScreenName": "CreateTodo", "Action": "Dismis"])]
        XCTAssertEventsEqual(expectedEvents, eventTracker.events)
    }

}
