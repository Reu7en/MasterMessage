//
//  MasterMessageConfigSet.swift
//  MasterMessage
//
//  Created by Reuben on 13/12/2024.
//

import Foundation

struct MasterMessageConfigSet: ConfigSet {
    let config: MasterMessageGameConfig
    let player: Player
    let timestamp: Date
    let id: UUID
    
    init(
        config: MasterMessageGameConfig,
        player: Player
    ) {
        self.config = config
        self.player = player
        self.timestamp = Date()
        self.id = UUID()
    }
}
