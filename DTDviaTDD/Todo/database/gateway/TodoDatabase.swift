//
//  TodosGateway.swift
//  Todo
//
//  Created by Scott Jones on 8/29/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation

protocol TodoDatabase: class {
    func save(_ todo: Todo) -> Todo
    func fetchTodo(by taskName: String) -> Todo?
    func allTodos() -> [Todo]
    func deleteAllTodos()
}
