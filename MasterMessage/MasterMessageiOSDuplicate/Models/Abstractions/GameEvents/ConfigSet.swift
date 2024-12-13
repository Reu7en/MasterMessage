//
//  ConfigSet.swift
//  MasterMessage
//
//  Created by Reuben on 13/12/2024.
//

import Foundation

protocol ConfigSet: GameEvent {
    associatedtype TypeGameConfig: GameConfig
    
    var config: TypeGameConfig { get }
}
