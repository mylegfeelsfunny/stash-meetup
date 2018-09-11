//
//  TestEvent.swift
//  TodoTests
//
//  Created by Scott Jones on 9/5/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation
@testable import Todo

public struct TestEvent: Event {
    public var name: String = ""
    public var properties: Properties = [:]

    public static func with(_ name: String, _ properties: Properties? = nil) -> TestEvent {
        return TestEvent(name: name, properties: properties ?? [:])
    }
}
