//
//  MasterMessageGameEventStore.swift
//  MasterMessage
//
//  Created by Reuben on 29/11/2024.
//

import Foundation

struct MasterMessageGameEventStore: GameEventStore {
    private(set) var events: [MasterMessageGameEvent]
    let timestamp: Date
    let id: UUID
    
    init(
        events: [MasterMessageGameEvent]
    ) {
        self.events = events
        self.timestamp = Date()
        self.id = UUID()
    }
    
    mutating func addEvent(_ event: MasterMessageGameEvent) {
        self.events.append(event)
    }
}
