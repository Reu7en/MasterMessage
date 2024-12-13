//
//  MasterMessageGameConfig.swift
//  MasterMessage
//
//  Created by Reuben on 13/12/2024.
//

import Foundation

struct MasterMessageGameConfig: GameConfig {    
    static let minPlayers: Int = 2
    static let maxPlayers: Int = 2
    static let minColors: Int = 4
    static let maxColors: Int = 6
    
    let numberOfColors: Int
    let allowDuplicates: Bool
    let allowEmpty: Bool
    
    var isValid: Bool {
        self.numberOfColors > 0
    }
    
    init() {
        self.numberOfColors = -1
        self.allowDuplicates = false
        self.allowEmpty = false
    }
    
    init(
        numberOfColors: Int,
        allowDuplicates: Bool,
        allowEmpty: Bool
    ) {
        self.numberOfColors = numberOfColors
        self.allowDuplicates = allowDuplicates
        self.allowEmpty = allowEmpty
    }
}
