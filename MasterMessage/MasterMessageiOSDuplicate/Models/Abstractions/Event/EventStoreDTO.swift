//
//  EventStoreDTO.swift
//  MasterMessage
//
//  Created by Reuben on 12/12/2024.
//

import Foundation

protocol EventStoreDTO: Identifiable, Codable {
    associatedtype TypeEventStore: EventStore
    
    var encodedEvents: [Data] { get }
    var id: UUID { get }
    
    func toConcrete() -> TypeEventStore?
}
