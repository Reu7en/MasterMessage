//
//  PlayerMoved.swift
//  MasterMessage
//
//  Created by Reuben on 29/11/2024.
//

import Foundation

protocol PlayerMoved: GameEvent {
    associatedtype TypeMove: GameMove
    
    var move: TypeMove { get }
}
