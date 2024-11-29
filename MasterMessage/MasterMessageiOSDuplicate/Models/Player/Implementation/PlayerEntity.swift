//
//  PlayerEntity.swift
//  MasterMessageiOSDuplicate
//
//  Created by Reuben on 29/11/2024.
//

import Foundation

struct PlayerEntity: Player {
    let id: UUID
    
    init() {
        self.id = UUID()
    }
}
