//
//  TodosInteractorTests.swift
//  Todo
//
//  Created by Scott Jones on 8/31/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import XCTest
@testable import Todo

class TodosInteractorTests: XCTestCase {

    var sut: TodosInteractor!
    var output: MockTodosInteractorOutput!
    var database: StubTodoDatabase!

    override func setUp() {
        super.setUp()

        database = StubTodoDatabase()
        output = MockTodosInteractorOutput()

        sut = TodosInteractor(database: database)
        sut.output = output
    }

    override func tearDown() {
        database = nil
        output = nil
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

extension TodosInteractorTests {

    func test_whenFetchAllIsCalled_theOutputReceivesTodos() {
        database.stubTodos = stubTodos

        sut.fetchTodos()

        XCTAssertEqual(2, output.fetchedTodosSpy.count)
    }

    func test_whenCreateIsCalled_theOutputRecievesASingleTodo() {
        let todo = Todo(taskName: "create sample app", isCompleted: false)
        database.stubTodo = todo

        sut.create(todo: todo)

        XCTAssertEqual(todo, output.fetchedTodoSpy)
    }

    func test_whenCallingToggleTodo_theCompletionIsTheOpposite() {
        let todo = Todo(taskName: "create sample app", isCompleted: false)

        sut.toggle(todo: todo)

        guard let spy = database.todoSpy else { XCTFail(); return }
        XCTAssertEqual(todo.taskName, spy.taskName)
        XCTAssertTrue(spy.isCompleted)
    }

    func test_whenDeleteAllIsCalled_theDatabaseDeletesAll() {
        sut.deleteAll()

        XCTAssertEqual(1, database.deleteAllTodosCallCount)
        XCTAssertEqual(0, output.fetchedTodosSpy.count)
    }

}
