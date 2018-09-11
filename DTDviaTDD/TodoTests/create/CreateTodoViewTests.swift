//
//  CreateTodoViewTests.swift
//  TodoTests
//
//  Created by Scott Jones on 9/3/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation
import XCTest
@testable import Todo

class CreateTodoViewTests: XCTestCase {
    
    var sut: CreateTodoViewController!
    var presenter: MockCreateTodoPresenter!

    override func setUp() {
        super.setUp()
        sut = CreateTodoViewController()
        presenter = MockCreateTodoPresenter()

        sut.presenter = presenter
    }

    override func tearDown() {
        presenter = nil
        sut = nil
        super.tearDown()
    }

}

extension CreateTodoViewTests {

    func test_whenTableLoaded_numberOfRowsInTableIsOne() {
        XCTAssertEqual(1, sut.tableView(sut.tableView, numberOfRowsInSection: 0))
    }

    func test_whenTableLoaded_cellIsReturned() {
        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cell)
    }

    func test_whenViewDidLoadCalled_presenterViewDidLoadCalled() {
        sut.viewDidLoad()

        XCTAssertEqual(1, presenter.didLoadCount)
    }

    func test_whenTextFieldIsEmptyDismissCalled_presenterDismissCalled() {
        sut.textField.text = nil
        
        sut.editingDidEndOnExit(sut.textField)

        XCTAssertEqual(1, presenter.dismissCallCount)
    }

    func test_whenTextFieldIsNotEmptyDismissCalled_presenterCreateCalled() {
        sut.textField.text = "create tests for create view"

        sut.editingDidEndOnExit(sut.textField)

        XCTAssertEqual(1, presenter.createTodoCallCount)
        XCTAssertNotNil(presenter.createTaskNameSpy)
    }

}
