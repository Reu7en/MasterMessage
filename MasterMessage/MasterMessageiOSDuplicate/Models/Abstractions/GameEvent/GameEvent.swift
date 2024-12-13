//
//  GameEvent.swift
//  MasterMessage
//
//  Created by Reuben on 29/11/2024.
//

import Foundation

protocol GameEvent: Event {
    var player: Player { get }
}
