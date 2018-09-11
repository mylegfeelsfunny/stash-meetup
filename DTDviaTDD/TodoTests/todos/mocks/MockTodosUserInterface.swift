//
//  MockTodosUserInterface.swift
//  Todo
//
//  Created by Scott Jones on 8/31/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation
@testable import Todo

class MockTodosUserInterface {
    var configureCallCount = 0
    var configureSpy: TodosViewModel?
}

extension MockTodosUserInterface: TodosUserInterface {

    func configure(with viewModel: TodosViewModel) {
        configureCallCount += 1
        configureSpy = viewModel
    }
    
}
