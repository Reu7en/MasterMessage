//
//  PlayerSetup.swift
//  MasterMessage
//
//  Created by Reuben on 12/12/2024.
//

import Foundation

protocol PlayerSetup: GameEvent {
    associatedtype TypeGameSetup: GameSetup
    
    var setup: TypeGameSetup { get }
}
