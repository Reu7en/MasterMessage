//
//  Event.swift
//  MasterMessageiOSDuplicate
//
//  Created by Reuben on 28/11/2024.
//

import Foundation

protocol Event: Identifiable, Codable {
    associatedtype TypeEventData: EventData
    
    var eventData: TypeEventData { get }
    var timestamp: Date { get }
    var id: UUID { get }
}
