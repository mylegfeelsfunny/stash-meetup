//
//  MockCreateTodoRouter.swift
//  Todo
//
//  Created by Scott Jones on 9/1/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation
@testable import Todo

class MockCreateTodoRouter {
    var dismissCallCount = 0
}

extension MockCreateTodoRouter: CreateTodoRouterInterface {

    func dismiss() {
        dismissCallCount += 1
    }

}
