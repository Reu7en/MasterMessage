//
//  MasterMessagePlayerMoved.swift
//  MasterMessage
//
//  Created by Reuben on 29/11/2024.
//

import Foundation

struct MasterMessagePlayerMoved: PlayerMoved {
    let move: CombinationGuess
    let player: Player
    let timestamp: Date
    let id: UUID
    
    init(
        move: CombinationGuess,
        player: Player
    ) {
        self.move = move
        self.player = player
        self.timestamp = Date()
        self.id = UUID()
    }
}
