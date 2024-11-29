//
//  GameEventData.swift
//  MasterMessage
//
//  Created by Reuben on 29/11/2024.
//

import Foundation

protocol GameEventData: EventData  {
    associatedtype TypeGameEventType: GameEventType
    associatedtype TypePlayer: Player
    
    var eventType: TypeGameEventType { get }
    var player: TypePlayer { get }
}
