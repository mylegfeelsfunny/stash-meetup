//
//  TodosViewTests.swift
//  TodoTests
//
//  Created by Scott Jones on 9/3/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation
import XCTest
@testable import Todo

class TodosViewTests: XCTestCase {

    var sut: TodosViewController!
    var presenter: MockTodosPresenter!

    override func setUp() {
        super.setUp()
        sut = TodosViewController()
        presenter = MockTodosPresenter()

        sut.presenter = presenter
    }

    override func tearDown() {
        presenter = nil
        sut = nil
        super.tearDown()
    }

}

extension TodosViewTests {

    func test_WhenViewWillAppearCalled_presenterViewWillAppearCalled() {
        sut.viewWillAppear(true)

        XCTAssertEqual(1, presenter.willAppearCallCount)
    }

    func test_WhenCreateCalled_presenterCreateCalled() {
        sut.create()

        XCTAssertEqual(1, presenter.createCallCount)
    }

    func test_WhenToggleTodoCalled_presenterToggleCalled() {
        let todo = Todo(taskName: "test view of sample app", isCompleted: false)
        sut.configure(with: TodosViewModel(todos: [todo]))

        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))

        XCTAssertEqual(1, presenter.toggleCallCount)
        XCTAssertNotNil(presenter.todoSpy)
    }

    func test_WhenDeleteAllCalled_presenterDeleteAllCalled() {
        sut.deleteAll()

        XCTAssertEqual(1, presenter.deleteAllCallCount)
    }

}
