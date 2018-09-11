//
//  TodoEventTracker.swift
//  Todo
//
//  Created by Scott Jones on 9/5/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation

struct TodoEventTracker {

    let eventTracker: EventTracking

    init(eventTracker: EventTracking) {
        self.eventTracker = eventTracker
    }

}

extension TodoEventTracker: TodoEventTracking {

    func sendDidAppearEvent() {
        var event = TodoEvent()
        event.screenName = .todos
        eventTracker.track(event)
    }
    
    func sendToggleEvent(todo: Todo) {
        var event = TodoEvent()
        event.toggle(with: todo)
        eventTracker.track(event)
    }

    func sendDeleteAll() {
        var event = TodoEvent()
        event.action = .deleteAll
        eventTracker.track(event)
    }

}

extension TodoEventTracker: CreateTodoEventTracking {

    func sendDidLoadEvent() {
        var event = TodoEvent()
        event.screenName = .create
        eventTracker.track(event)
    }

    func sendDidCreateEvent(todo: Todo) {
        var event = TodoEvent()
        event.didCreate(with: todo)
        eventTracker.track(event)
    }

    func dismiss() {
        var event = TodoEvent()
        event.screenName = .create
        event.action = .dismis
        eventTracker.track(event)
    }

}

