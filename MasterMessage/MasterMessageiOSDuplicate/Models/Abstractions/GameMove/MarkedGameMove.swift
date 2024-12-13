//
//  MarkedGameMove.swift
//  MasterMessage
//
//  Created by Reuben on 13/12/2024.
//

import Foundation

protocol MarkedGameMove {
    associatedtype TypeGameMove: GameMove
    associatedtype TypeGameMoveMark: GameMoveMark
    
    var move: TypeGameMove { get }
    var mark: TypeGameMoveMark? { get }
    var isValid: Bool { get }
    var isCorrect: Bool { get }
}
