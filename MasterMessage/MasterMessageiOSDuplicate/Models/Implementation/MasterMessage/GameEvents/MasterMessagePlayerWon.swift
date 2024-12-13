//
//  MasterMessagePlayerWon.swift
//  MasterMessage
//
//  Created by Reuben on 13/12/2024.
//

import Foundation

struct MasterMessagePlayerWon: PlayerWon {
    let player: Player
    let timestamp: Date
    let id: UUID
    
    init(
        player: Player
    ) {
        self.player = player
        self.timestamp = Date()
        self.id = UUID()
    }
}
