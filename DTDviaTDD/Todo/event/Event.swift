//
//  Event.swift
//  Todo
//
//  Created by Scott Jones on 9/5/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation

protocol Event {
    typealias Properties = [String: Any]

    var name: String { get }
    var properties: Properties { get }
}
