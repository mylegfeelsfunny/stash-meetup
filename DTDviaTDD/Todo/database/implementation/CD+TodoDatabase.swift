//
//  CDTodo+CoreDataProperties.swift
//  Todo
//
//  Created by Scott Jones on 8/29/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//
//

import Foundation
import CoreData

extension NSManagedObjectContext: TodoDatabase {

    @discardableResult
    func save(_ todo: Todo) -> Todo  {
        if let fetched = _fetchTodo(by: todo.taskName) {
            todo.map(to: fetched)
            _saveOrRollback()
            return fetched.todo
        } else {
            let cdtodo = todo.insertInto(context: self)
            _saveOrRollback()
            return cdtodo.todo
        }
    }

    func fetchTodo(by taskName: String) -> Todo? {
        return _fetchTodo(by: taskName)?.todo
    }

    func allTodos() -> [Todo] {
        let todos = fetch()
        return todos.map { $0.todo }
    }

    func deleteAllTodos() {
        let todos = fetch()
        for i in todos { delete(i) }
        _saveOrRollback()
    }

    private func fetch() -> [CDTodo] {
        do {
            let request: NSFetchRequest<CDTodo> = CDTodo.fetchRequest()
            request.sortDescriptors = CDTodo.defaultSortDescriptors
            let todos = try fetch(request)
            return todos
        } catch { return [] }
    }

    private func _fetchTodo(by taskName: String) -> CDTodo? {
        do {
            let request: NSFetchRequest<CDTodo> = CDTodo.fetchRequest()
            request.predicate = CDTodo.predicate(taskName: taskName)
            request.fetchLimit = 1
            let todos = try fetch(request)
            guard let first = todos.first else { return nil }
            return first
        } catch { return nil }
    }

    private func _saveOrRollback() {
        do {
            if hasChanges {
                try save()
            }
        } catch {
            rollback()
        }
    }
}

extension CDTodo {

    fileprivate var todo: Todo {
        return Todo(taskName: taskName, isCompleted: isCompleted)
    }

}

extension Todo {

    fileprivate func map(to cdtodo: CDTodo) {
        cdtodo.taskName = taskName
        cdtodo.isCompleted = isCompleted
    }

    @discardableResult
    fileprivate func insertInto(context: NSManagedObjectContext) -> CDTodo {
        guard let entity = NSEntityDescription.entity(forEntityName: "CDTodo", in: context) else {
            fatalError("Todos is not a valid entity")
        }
        let cdtodo = CDTodo(entity: entity, insertInto: context)
        map(to: cdtodo)
        cdtodo.createdAt = Date()
        return cdtodo
    }

}

