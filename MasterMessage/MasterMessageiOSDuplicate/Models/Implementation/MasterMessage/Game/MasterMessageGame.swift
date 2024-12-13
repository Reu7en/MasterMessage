//
//  MasterMessageGame.swift
//  MasterMessage
//
//  Created by Reuben on 13/12/2024.
//

import Foundation

struct MasterMessageGame: Game {
    private(set) var eventStore: MasterMessageEventStore
    private(set) var state: MasterMessageGameState
    private(set) var config: MasterMessageGameConfig
    
    var isValid: Bool {
        self.state.isValid && self.config.isValid
    }
    
    var hasFinished: Bool {
        self.state.hasFinished
    }
    
    let id: UUID
    
    init(
        from eventStore: MasterMessageEventStore
    ) {
        self.eventStore = eventStore
        self.state = MasterMessageGameState()
        self.config = MasterMessageGameConfig()
        self.id = eventStore.id
        
        self.replayEvents()
    }
    
    init() {
        let id = UUID()
        
        self.init(id: id)
    }
    
    private init(
        id: UUID
    ) {
        self.eventStore = MasterMessageEventStore(id: id)
        self.state = MasterMessageGameState()
        self.config = MasterMessageGameConfig()
        self.id = id
    }
    
    mutating func applyEvent(_ event: any Event) {
        switch event {
        case let configSet as MasterMessageConfigSet:
            self.config = configSet.config
        case let playerSetup as MasterMessagePlayerSetup:
            self.state.addCombination(playerSetup.setup, for: playerSetup.player)
        case let playerMoved as MasterMessagePlayerMoved:
            self.state.addMove(playerMoved.move, for: playerMoved.player)
        case let playerWon as MasterMessagePlayerWon:
            self.state.setWinner(playerWon.player)
        default:
            return
        }
        
        self.eventStore.addEvent(event)
    }
    
    mutating func replayEvents() {
        for event in self.eventStore.events {
            self.applyEvent(event)
        }
    }
}
