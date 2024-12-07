//
//  GameEventData.swift
//  MasterMessage
//
//  Created by Reuben on 29/11/2024.
//

import Foundation

protocol GameEventData: EventData  {
    associatedtype TypePlayer: Player

    var player: TypePlayer { get }
}
