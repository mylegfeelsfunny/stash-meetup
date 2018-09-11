//
//  TestContext.swift
//  TodoTests
//
//  Created by Scott Jones on 8/29/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import CoreData

extension NSManagedObjectContext {

    static var inMemory: NSManagedObjectContext {
        let container = NSPersistentContainer(name: "Todo")
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container.viewContext
    }

}
