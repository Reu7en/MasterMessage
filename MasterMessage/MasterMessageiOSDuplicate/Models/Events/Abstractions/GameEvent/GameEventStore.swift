//
//  GameEventStore.swift
//  MasterMessage
//
//  Created by Reuben on 29/11/2024.
//

import Foundation

protocol GameEventStore: EventStore {
    associatedtype TypeGameEvent: GameEvent
    
    var events: [TypeGameEvent] { get }
    var timestamp: Date { get }
    var id: UUID { get }
    
    mutating func addEvent(_ event: TypeGameEvent)
}
