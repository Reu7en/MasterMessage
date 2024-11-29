//
//  MasterMessageGameEventData.swift
//  MasterMessage
//
//  Created by Reuben on 29/11/2024.
//

import Foundation

struct MasterMessageGameEventData: GameEventData {
    let eventType: MasterMessageGameEventType
    let player: PlayerEntity
    
    init(
        eventType: MasterMessageGameEventType,
        player: PlayerEntity
    ) {
        self.eventType = eventType
        self.player = player
    }
}
