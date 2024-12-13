//
//  GameState.swift
//  MasterMessage
//
//  Created by Reuben on 13/12/2024.
//

import Foundation

protocol GameState: State {
    associatedtype TypeGameMove: GameMove
    associatedtype TypePlayerState: PlayerState
    
    var moves: [Player: [TypeGameMove]] { get }
    var winner: Player? { get }
    var hasFinished: Bool { get }
    
    mutating func addMove(_ move: TypeGameMove, for player: Player)
    
    mutating func setWinner(_ winner: Player)
    
    func getMoves(for player: Player) -> [TypeGameMove]
    
    func getState(for player: Player) -> TypePlayerState?
}
