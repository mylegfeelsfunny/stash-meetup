//
//  EventTracker+EventTracking.swift
//  Todo
//
//  Created by Scott Jones on 9/5/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import Foundation

class MixpanelEventTracker {

//    private let mixpanelInstance: MixpanelInstance

    init() {
//        mixpanelInstance = Mixpanel.initialize(token: "XXXX")
    }

}

extension MixpanelEventTracker: EventTracking {

    func track(_ event: Event) {
//        mixpanelInstance.track(event: event.name, properties: event.properties)
    }

}
