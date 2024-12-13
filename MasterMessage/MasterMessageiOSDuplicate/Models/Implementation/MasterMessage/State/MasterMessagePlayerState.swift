//
//  MasterMessagePlayerState.swift
//  MasterMessage
//
//  Created by Reuben on 13/12/2024.
//

import Foundation

struct MasterMessagePlayerState: PlayerState {
    let markedMoves: [MarkedCombinationGuess]
    
    var isValid: Bool {
        self.markedMoves.allSatisfy { $0.isValid }
    }
    
    init(
        moves: [CombinationGuess],
        combinationToGuess: CombinationSetup
    ) {
        self.markedMoves = moves.map { MarkedCombinationGuess(move: $0, combinationToGuess: combinationToGuess) }
    }
}
