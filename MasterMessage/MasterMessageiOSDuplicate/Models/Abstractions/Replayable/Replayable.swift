//
//  Replayable.swift
//  MasterMessageiOSDuplicate
//
//  Created by Reuben on 12/12/2024.
//

import Foundation

protocol Replayable: Identifiable {
    associatedtype TypeState: State
    associatedtype TypeEventStore: EventStore
    
    var eventStore: TypeEventStore { get }
    var state: TypeState { get }
    var isValid: Bool { get }
    var id: UUID { get }
    
    mutating func applyEvent(_ event: any Event)
    
    mutating func replayEvents()
}
