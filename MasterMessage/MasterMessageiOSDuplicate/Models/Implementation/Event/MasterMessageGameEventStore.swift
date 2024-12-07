//
//  MasterMessageGameEventStore.swift
//  MasterMessage
//
//  Created by Reuben on 29/11/2024.
//

import Foundation

struct MasterMessageGameEventStore<T: GameEvent>: GameEventStore {
    private(set) var events: [T]
    let timestamp: Date
    let id: UUID
    
    init(
        events: [T]
    ) {
        self.events = events
        self.timestamp = Date()
        self.id = UUID()
    }
    
    mutating func addEvent(_ event: T) {
        self.events.append(event)
    }
}

struct Foo<T: GameEvent>: Codable {
    private(set) var events: [T]
    
    init() {
        self.events = []
    }
    
    mutating func addEvent(_ event: T) {
        self.events.append(event)
    }
}
