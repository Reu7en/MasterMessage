//
//  GameMove.swift
//  MasterMessage
//
//  Created by Reuben on 29/11/2024.
//

import Foundation

protocol GameMove: GameEvent {
    associatedtype TypeMove: Move
    
    var move: TypeMove { get }
}
