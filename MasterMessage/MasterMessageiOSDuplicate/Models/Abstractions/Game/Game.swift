//
//  Game.swift
//  MasterMessage
//
//  Created by Reuben on 13/12/2024.
//

import Foundation

protocol Game: Replayable {    
    static var minPlayers: Int { get }
    static var maxPlayers: Int { get }
    
    var hasFinished: Bool { get }
}
