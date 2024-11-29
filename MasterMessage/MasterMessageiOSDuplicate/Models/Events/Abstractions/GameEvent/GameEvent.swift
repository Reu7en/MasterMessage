//
//  GameEvent.swift
//  MasterMessage
//
//  Created by Reuben on 29/11/2024.
//

import Foundation

protocol GameEvent: Event {
    associatedtype TypeGameEventData: GameEventData
    
    var eventData: TypeGameEventData { get }
    var timestamp: Date { get }
    var id: UUID { get }
}
