//
//  MasterMessageEventStore.swift
//  MasterMessage
//
//  Created by Reuben on 29/11/2024.
//

import Foundation

struct MasterMessageEventStore: EventStore {
    private(set) var events: [any Event]
    let id: UUID
    
    init(
        id: UUID
    ) {
        self.events = []
        self.id = id
    }
    
    init(
        events: [any Event],
        id: UUID
    ) {
        self.events = events
        self.id = id
    }
    
    mutating func addEvent(_ event: any Event) {
        self.events.append(event)
    }
    
    func toDTO() -> MasterMessageEventStoreDTO? {
        let encoder = JSONEncoder()
        var encodedEvents: [Data] = []
        
        for event in self.events {
            guard let encodedEvent = try? encoder.encode(event) else { return nil }
            
            encodedEvents.append(encodedEvent)
        }
        
        return MasterMessageEventStoreDTO(encodedEvents: encodedEvents)
    }
}
