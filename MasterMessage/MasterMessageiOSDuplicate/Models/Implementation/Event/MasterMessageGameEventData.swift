//
//  MasterMessageGameEventData.swift
//  MasterMessage
//
//  Created by Reuben on 29/11/2024.
//

import Foundation

struct MasterMessageGameEventData: GameEventData {
    let eventType: MasterMessageGameEventType
    let player: MasterMessagePlayer
    
    init(
        eventType: MasterMessageGameEventType,
        player: MasterMessagePlayer
    ) {
        self.eventType = eventType
        self.player = player
    }
}
