//
//  CDTodo+CoreDataClass.swift
//  Todo
//
//  Created by Scott Jones on 8/29/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//
//

import Foundation
import CoreData

public class CDTodo: NSManagedObject {
    @NSManaged public var taskName: String
    @NSManaged public var isCompleted: Bool
    @NSManaged public var createdAt: Date
}

extension CDTodo {

    enum Keys: String {
        case taskName
        case isCompleted
        case createdAt
    }

    public static var defaultSortDescriptors: [NSSortDescriptor] {
        return [
            NSSortDescriptor(key: Keys.createdAt.rawValue, ascending: true)
        ]
    }

    public static func fetchRequest() -> NSFetchRequest<CDTodo> {
        return NSFetchRequest<CDTodo>(entityName: "CDTodo")
    }

    public static func predicate(taskName: String) -> NSPredicate {
        return NSPredicate(format: "%K == %@", Keys.taskName.rawValue, taskName)
    }

}
