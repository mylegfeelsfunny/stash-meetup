//
//  TodoTests.swift
//  TodoTests
//
//  Created by Scott Jones on 8/29/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import XCTest
import CoreData
@testable import Todo

class TodoCoreDataTests: XCTestCase {

    let sut = NSManagedObjectContext.inMemory
    
    func testCanCreateTodo() {
        // given
        
        // when
        let todo = Todo(taskName: "create sample app", isCompleted: false)

        // then
        XCTAssertNotNil(todo)
    }

    func testCanSaveATodoToDatabase() {
        // given
        let todo = Todo(taskName: "create sample app", isCompleted: false)

        // when
        let coredataTodo = sut.save(todo)

        // then
        XCTAssertNotNil(coredataTodo)
    }

    func testsCanPullAllTodosFromDatabase() {
        // given
        let todo1 = Todo(taskName: "create sample app", isCompleted: false)
        let todo2 = Todo(taskName: "write unit tests", isCompleted: false)

        // when
        sut.save(todo1)
        sut.save(todo2)
        do { try sut.save() } catch {}

        // then
        let todos = sut.allTodos()
        XCTAssertEqual(2, todos.count)
    }

    func testFetchTodoFromDatabaseByName() {
        // given
        insert2Todos()
        do { try sut.save() } catch {}

        // when
        let requestedTodo = sut.fetchTodo(by: "write unit tests")

        // then
        XCTAssertEqual("write unit tests", requestedTodo?.taskName)
    }

     func testCanDeleteAllTodosFromDatabase() {
        // given
        insert2Todos()
        do { try sut.save() } catch {}

        // when
        sut.deleteAllTodos()

        // then
        let todos = sut.allTodos()
        XCTAssertEqual(0, todos.count)
    }

    func testReinsertingTodoUpdates_DoesNotCreateNewTodo() {
        // given
        insert2Todos()
        do { try sut.save() } catch {}

        // when
        let todo = Todo(taskName: "create sample app", isCompleted: false)
        sut.save(todo)

        // then
        XCTAssertEqual(2, sut.allTodos().count)
    }

}

extension TodoCoreDataTests {

    func insert2Todos() {
        let todo1 = Todo(taskName: "create sample app", isCompleted: false)
        let todo2 = Todo(taskName: "write unit tests", isCompleted: false)
        sut.save(todo1)
        sut.save(todo2)
    }

}
