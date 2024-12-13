//
//  CombinationGuessMark.swift
//  MasterMessage
//
//  Created by Reuben on 13/12/2024.
//

import Foundation

struct CombinationGuessMark: GameMoveMark {
    private let combinationToGuessLength: Int
    
    let redPegs: Int
    let whitePegs: Int
    
    var isCorrect: Bool {
        redPegs == combinationToGuessLength
    }
    
    init(
        redPegs: Int,
        whitePegs: Int,
        combinationToGuessLength: Int
    ) {
        self.redPegs = redPegs
        self.whitePegs = whitePegs
        self.combinationToGuessLength = combinationToGuessLength
    }
}
