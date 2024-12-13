//
//  MarkedCombinationGuess.swift
//  MasterMessage
//
//  Created by Reuben on 13/12/2024.
//

import Foundation

struct MarkedCombinationGuess: MarkedGameMove {
    private let combinationToGuess: CombinationSetup
    
    let move: CombinationGuess
    
    var mark: CombinationGuessMark? {
        self.calculateMark()
    }
    
    var isValid: Bool {
        self.mark != nil
    }
    
    var isCorrect: Bool {
        self.mark?.isCorrect ?? false
    }
    
    init(
        move: CombinationGuess,
        combinationToGuess: CombinationSetup
    ) {
        self.move = move
        self.combinationToGuess = combinationToGuess
    }
    
    private func calculateMark() -> CombinationGuessMark? {
        let combinationToGuessLength = self.combinationToGuess.combination.count
        
        guard self.move.combination.count == combinationToGuessLength else { return nil }
        
        var guess: [CombinationColor?] = self.move.combination
        var answer: [CombinationColor?] = self.combinationToGuess.combination
        
        var redPegs: Int = 0
        var whitePegs: Int = 0
        
        for index in 0..<combinationToGuessLength {
            if guess[index] == answer[index] {
                guess[index] = nil
                answer[index] = nil
                
                redPegs += 1
            }
        }
        
        for index in 0..<combinationToGuessLength {
            if let answerIndex = answer.firstIndex(of: guess[index]) {
                guess[index] = nil
                answer[answerIndex] = nil
                
                whitePegs += 1
            }
        }
        
        return CombinationGuessMark(redPegs: redPegs, whitePegs: whitePegs, combinationToGuessLength: combinationToGuessLength)
    }
}
