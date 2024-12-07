//
//  MasterMessageGameInvitation.swift
//  MasterMessage
//
//  Created by Reuben on 29/11/2024.
//

import Foundation

struct MasterMessageGameInvitation: GameInvitationEvent {
    let eventData: MasterMessageGameEventData
    let timestamp: Date
    let id: UUID
    
    init(
        eventData: MasterMessageGameEventData
    ) {
        self.eventData = eventData
        self.timestamp = Date()
        self.id = UUID()
    }
}
