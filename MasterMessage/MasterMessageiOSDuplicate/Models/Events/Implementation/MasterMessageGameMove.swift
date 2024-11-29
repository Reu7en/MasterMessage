//
//  MasterMessageGameMove.swift
//  MasterMessage
//
//  Created by Reuben on 29/11/2024.
//

import Foundation

struct MasterMessageGameMove: GameMove {
    let move: CombinationGuess
    let eventData: MasterMessageGameEventData
    let timestamp: Date
    let id: UUID
    
    init(
        move: CombinationGuess,
        eventData: MasterMessageGameEventData
    ) {
        self.move = move
        self.eventData = eventData
        self.timestamp = Date()
        self.id = UUID()
    }
}
