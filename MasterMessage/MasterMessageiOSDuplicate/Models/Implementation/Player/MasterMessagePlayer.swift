//
//  MasterMessagePlayer.swift
//  MasterMessageiOSDuplicate
//
//  Created by Reuben on 29/11/2024.
//

import Foundation

struct MasterMessagePlayer: Player {
    let id: UUID
    
    init(
        id: UUID
    ) {
        self.id = id
    }
}
