//
//  GameConfig.swift
//  MasterMessage
//
//  Created by Reuben on 13/12/2024.
//

import Foundation

protocol GameConfig: Codable {
    static var minPlayers: Int { get }
    static var maxPlayers: Int { get }
    
    var isValid: Bool { get }
}
