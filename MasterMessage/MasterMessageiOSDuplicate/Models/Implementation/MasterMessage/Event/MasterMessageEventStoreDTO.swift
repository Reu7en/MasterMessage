//
//  MasterMessageEventStoreDTO.swift
//  MasterMessage
//
//  Created by Reuben on 13/12/2024.
//

import Foundation

struct MasterMessageEventStoreDTO: EventStoreDTO {
    let encodedEvents: [Data]
    let id: UUID
    
    init(
        encodedEvents: [Data]
    ) {
        self.encodedEvents = encodedEvents
        self.id = UUID()
    }
    
    func toConcrete() -> MasterMessageEventStore? {
        let decoder = JSONDecoder()
        var events: [any GameEvent] = []
        
        for encodedEvent in self.encodedEvents {
            guard let event = try? decoder.decode(MasterMessagePlayerMoved.self, from: encodedEvent) else { return nil }
            
            events.append(event)
        }
        
        return MasterMessageEventStore(events: events, id: self.id)
    }
}
