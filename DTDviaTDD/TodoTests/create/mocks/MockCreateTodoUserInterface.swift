//
//  MockCreateTodoUserInterface.swift
//  Todo
//
//  Created by Scott Jones on 9/1/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation
@testable import Todo

class MockCreateTodoUserInterface {
    var configureCallCount = 0
}

extension MockCreateTodoUserInterface: CreateTodoUserInterface {

    func configure() {
        configureCallCount += 1
    }
    
}
