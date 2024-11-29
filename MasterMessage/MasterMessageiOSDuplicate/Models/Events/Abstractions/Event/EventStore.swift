//
//  EventStore.swift
//  MasterMessage
//
//  Created by Reuben on 29/11/2024.
//

import Foundation

protocol EventStore: Identifiable, Codable {
    associatedtype TypeEvent: Event
    
    var events: [TypeEvent] { get }
    var timestamp: Date { get }
    var id: UUID { get }
}
