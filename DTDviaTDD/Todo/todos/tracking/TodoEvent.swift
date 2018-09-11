//
//  TodoEvent.swift
//  Todo
//
//  Created by Scott Jones on 9/5/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation

struct TodoEvent: Event {

    let name = "Todo"
    var properties: Properties = [:]

    enum ScreenName: String {
        case todos = "Todos"
        case create = "CreateTodo"
    }

    enum Action: String {
        case toggle = "Toggle"
        case deleteAll = "DeleteAll"
        case didCreate = "DidCreate"
        case dismis = "Dismis"
    }

    var screenName: ScreenName = .todos {
        didSet {
            properties["ScreenName"] = screenName.rawValue
        }
    }

    var action: Action = .didCreate {
        didSet {
            properties["Action"] = action.rawValue
        }
    }

    var taskName: String? {
        didSet {
            properties["TaskName"] = taskName
        }
    }


    mutating func toggle(with todo: Todo) {
        taskName = todo.taskName
        action = .toggle
    }

    mutating func didCreate(with todo: Todo) {
        taskName = todo.taskName
        action = .didCreate
    }

}
