//
//  TodosEventTests.swift
//  TodoTests
//
//  Created by Scott Jones on 9/5/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import XCTest
@testable import Todo

class TodosEventTests: XCTestCase {

    var todoEventTracker: TodoEventTracker!
    var eventTracker: MockEventTracker!
    var presenter: TodosPresenter!

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
    
    func test_willAppear_sendsTodosScreenNameEvent() {
        // given
        presenter = TodosPresenter(eventTracker: todoEventTracker)

        // when
        presenter.willAppear()

        // then
        let expectedEvents: [TestEvent] = [.with("Todo", ["ScreenName": "Todos"])]
        XCTAssertEventsEqual(expectedEvents, eventTracker.events)
    }

    func test_toggleTodo_sendsTodosToggleEvent() {
        // given
        presenter = TodosPresenter(eventTracker: todoEventTracker)

        // when
        let todo = Todo(taskName: "test sample todo", isCompleted: false)
        presenter.toggle(todo: todo)

        // then
        let expectedEvents: [TestEvent] = [.with("Todo", ["TaskName": "test sample todo", "Action": "Toggle"])]
        XCTAssertEventsEqual(expectedEvents, eventTracker.events)
    }

    func test_deleteAll_sendsTodosDeleteAllEvent() {
        // given
        presenter = TodosPresenter(eventTracker: todoEventTracker)

        // when
        presenter.deleteAll()

        // then
        let expectedEvents: [TestEvent] = [.with("Todo", ["Action": "DeleteAll"])]
        XCTAssertEventsEqual(expectedEvents, eventTracker.events)
    }


}
