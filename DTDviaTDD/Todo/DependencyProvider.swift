//
//  DependencyProvider.swift
//  Todo
//
//  Created by Scott Jones on 9/5/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation

protocol DependencyProviding: class, DatabaseProviding, EventTrackersProviding {}

protocol DatabaseProviding {
    var database: TodoDatabase { get }
}
protocol EventTrackersProviding {
    var eventTracker: EventTracking { get }
}

class Single: DependencyProviding {

    static let shared = Single()

    static var database: TodoDatabase {
        return shared.database
    }

    static var eventTracker: EventTracking {
        return shared.eventTracker
    }

    let eventTracker: EventTracking
    let database: TodoDatabase

    init() {
        self.database = AppDelegate.database
        self.eventTracker = MixpanelEventTracker()
    }

}
