//
//  EventStore.swift
//  MasterMessage
//
//  Created by Reuben on 29/11/2024.
//

import Foundation

protocol EventStore: Identifiable {
    associatedtype TypeEventStoreDTO: EventStoreDTO
    
    var events: [any Event] { get }
    var id: UUID { get }
    
    mutating func addEvent(_ event: any Event)
    
    func toDTO() -> TypeEventStoreDTO?
}
