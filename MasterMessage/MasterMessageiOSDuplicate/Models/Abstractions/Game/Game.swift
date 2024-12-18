//
//  Game.swift
//  MasterMessage
//
//  Created by Reuben on 13/12/2024.
//

import Foundation

protocol Game: Replayable {
    associatedtype TypeGameConfig: GameConfig
    
    var config: TypeGameConfig { get }
    var hasFinished: Bool { get }
}
