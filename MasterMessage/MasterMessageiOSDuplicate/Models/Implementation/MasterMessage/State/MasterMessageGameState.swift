//
//  MasterMessageGameState.swift
//  MasterMessage
//
//  Created by Reuben on 13/12/2024.
//

import Foundation

struct MasterMessageGameState: GameState {
    private(set) var combinations: [Player: CombinationSetup]
    private(set) var moves: [Player : [CombinationGuess]]
    private(set) var winner: Player?
    
    var isValid: Bool {
        combinations.keys.count >= MasterMessageGameConfig.minPlayers && moves.keys.count >= MasterMessageGameConfig.minPlayers &&
        combinations.keys.count <= MasterMessageGameConfig.maxPlayers && moves.keys.count <= MasterMessageGameConfig.maxPlayers
    }
    
    var hasFinished: Bool {
        self.winner != nil
    }
    
    init() {
        self.combinations = [:]
        self.moves = [:]
        self.winner = nil
    }
    
    mutating func addCombination(_ combination: CombinationSetup, for player: Player) {
        self.combinations[player] = combination
    }
    
    mutating func addMove(_ move: CombinationGuess, for player: Player) {
        self.moves[player, default: []].append(move)
    }
    
    mutating func setWinner(_ winner: Player) {
        if !self.hasFinished {
            self.winner = winner
        }
    }
    
    func getMoves(for player: Player) -> [CombinationGuess] {
        return self.moves[player, default: []]
    }
    
    func getState(for player: Player) -> MasterMessagePlayerState? {
        guard let combinationToGuess = self.combinationToGuess(for: player) else { return nil }
        
        return MasterMessagePlayerState(moves: self.getMoves(for: player), combinationToGuess: combinationToGuess)
    }
    
    func combinationToGuess(for player: Player) -> CombinationSetup? {
        return self.combinations.first { $0.key != player }?.value
    }
}
