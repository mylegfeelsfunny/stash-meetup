//
//  MockEventTracker.swift
//  TodoTests
//
//  Created by Scott Jones on 9/5/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation
import XCTest
@testable import Todo

public class MockEventTracker {

    public private(set) var events: [Event] = []

    public init() {}

    public func clearEvents() {
        events.removeAll()
    }

}

extension MockEventTracker: EventTracking {

    public func track(_ event: Event) {
        events.append(event)
    }

}

extension Array where Iterator.Element == Event {

    public static func == (lhs: [Event], rhs: [Event]) -> Bool {
        return lhs.toString == rhs.toString
    }

    public var toString: String {
        return self.sorted { $0.name < $1.name }.reduce("") { r, n in
            let t = n.name + "\(n.properties.toString)\n"
            return r + t
        }
    }

}

extension Sequence where Iterator.Element == (key: String, value: Any) {

    public var toString: String {
        return String(sorted { $0.0 < $1.0 }.reduce("") { r, n in
            let t = "\n\t\(n.0): \(n.1),"
            return r + t
            }.dropLast())
    }

}

func XCTAssertEventsEqual(_ expectedEvents: [Event], _ collectedEvents: [Event], message: String = "Expected events do not match collected events.\nExpected events:\n%@\nCollected events:\n%@", file: StaticString = #file, line: UInt = #line) {
    if expectedEvents.toString != collectedEvents.toString {
        XCTFail(String(format: message, expectedEvents.toString, collectedEvents.toString), file: file, line: line)
    }
    XCTAssert(true)
}
