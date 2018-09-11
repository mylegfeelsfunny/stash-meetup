//
//  MockTodoEventTracker.swift
//  TodoTests
//
//  Created by Scott Jones on 9/5/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation
@testable import Todo

struct MockTodoEventTracker {}

extension MockTodoEventTracker: TodoEventTracking {

    func sendDidAppearEvent() {}
    func sendToggleEvent(todo: Todo) {}
    func sendDeleteAll() {}

}

extension MockTodoEventTracker: CreateTodoEventTracking {

    func sendDidLoadEvent() {}
    func sendDidCreateEvent(todo: Todo) {}
    func dismiss() {}

}

