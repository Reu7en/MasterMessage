//
//  MasterMessagePlayerSetup.swift
//  MasterMessage
//
//  Created by Reuben on 13/12/2024.
//

import Foundation

struct MasterMessagePlayerSetup: PlayerSetup {
    let setup: CombinationSetup
    let player: Player
    let timestamp: Date
    let id: UUID
    
    init(
        setup: CombinationSetup,
        player: Player
    ) {
        self.setup = setup
        self.player = player
        self.timestamp = Date()
        self.id = UUID()
    }
}
