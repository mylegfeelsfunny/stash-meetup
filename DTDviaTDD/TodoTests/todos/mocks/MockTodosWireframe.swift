//
//  MockTodosRouter.swift
//  Todo
//
//  Created by Scott Jones on 8/31/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation
@testable import Todo

class MockTodosRouter {
    var sendToCreateCallCount = 0
}

extension MockTodosRouter: TodosRouterInterface {
    
    func sendToCreate() {
        sendToCreateCallCount += 1
    }

}
