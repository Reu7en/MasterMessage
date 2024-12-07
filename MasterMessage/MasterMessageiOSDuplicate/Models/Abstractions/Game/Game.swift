//
//  Game.swift
//  MasterMessageiOSDuplicate
//
//  Created by Reuben on 29/11/2024.
//

import Foundation

protocol Replayable: Identifiable {
    associatedtype TypeState: State
    associatedtype TypeEvent: Event
    associatedtype TypeEventStore: EventStore
    
    var state: TypeState { get }
    var id: UUID { get }
    
    mutating func applyEvent(_ event: TypeEvent)
    
    mutating func replayEvents(from eventStore: TypeEventStore)
}

protocol State: Codable {}

protocol Game: Replayable {
    associatedtype TypeGameConfig: GameConfig
    
    var config: TypeGameConfig { get }
}

protocol GameState: State {
    associatedtype TypePlayer: Player
    associatedtype TypeMove: Move
    
    var moves: [TypePlayer: [TypeMove]] { get }
}

protocol GameConfig: Codable {}

struct MasterMessageGame<T: GameEvent>: Game {
    private(set) var state: MasterMessageGameState
    private(set) var config: MasterMessageGameConfig
    let id: UUID
    
    init() {
        self.state = MasterMessageGameState()
        self.config = MasterMessageGameConfig()
        self.id = UUID()
    }
    
    mutating func applyEvent(_ event: T) {
        switch event {
        case let gameMoveEvent as MasterMessageGameMove:
            self.state.addMove(gameMoveEvent.move, for: gameMoveEvent.eventData.player)
        default:
            return
        }
    }
    
    mutating func replayEvents(from eventStore: MasterMessageGameEventStore<T>) {
        for event in eventStore.events {
            self.applyEvent(event)
        }
    }
}

struct MasterMessageGameState: GameState {
    private(set) var moves: [MasterMessagePlayer: [CombinationGuess]]
    
    init() {
        self.moves = [:]
    }
    
    mutating func addMove(_ move: CombinationGuess, for player: MasterMessagePlayer) {
        self.moves[player]?.append(move)
    }
}

struct MasterMessageGameConfig: GameConfig {
    private(set) var allowDuplicates: Bool
    private(set) var allowGaps: Bool
    private(set) var numberOfColors: Int
    private(set) var combinationLength: Int
    
    init() {
        self.allowDuplicates = false
        self.allowGaps = false
        self.numberOfColors = 6
        self.combinationLength = 4
    }
    
    mutating func setAllowDuplicates(to allowDuplicates: Bool) {
        self.allowDuplicates = allowDuplicates
    }
    
    mutating func setAllowGaps(to allowGaps: Bool) {
        self.allowGaps = allowGaps
    }
    
    mutating func setNumberOfColors(to numberOfColors: Int) {
        self.numberOfColors = numberOfColors
    }
    
    mutating func setCombinationLength(to combinationLength: Int) {
        self.combinationLength = combinationLength
    }
}

protocol MyProtocol: Codable {
    var foo: String { get }
    var bar: String { get }
}

struct MyImplementation1: MyProtocol {
    let foo: String
    let bar: String
    let baz: String
    
    init(foo: String, bar: String, baz: String) {
        self.foo = foo
        self.bar = bar
        self.baz = baz
    }
}

struct MyImplementation2: MyProtocol {
    let foo: String
    let bar: String
    let qux: String
}

struct MyCollection {
    let implementations: [MyProtocol]
    
    init(implementations: [MyProtocol]) {
        self.implementations = implementations
    }
    
    func adapt() -> MyCollectionDto {
        let encoder = JSONEncoder()
        var values: [Data] = []
        
        for implementation in self.implementations {
            if let encoded = try? encoder.encode(implementation) {
                values.append(encoded)
            }
        }
        
        return MyCollectionDto(encodedImplementations: values)
    }
}

struct MyCollectionDto: Codable {
    let encodedImplementations: [Data]
    
    init(encodedImplementations: [Data]) {
        self.encodedImplementations = encodedImplementations
    }
    
    func adapt() -> MyCollection {
        let decoder = JSONDecoder()
        var values: [MyProtocol] = []
        
        for encodedImplementation in encodedImplementations {
            if let decoded = try? decoder.decode(MyImplementation1.self, from: encodedImplementation) {
                values.append(decoded)
            } else if let decoded = try? decoder.decode(MyImplementation2.self, from: encodedImplementation) {
                values.append(decoded)
            }
        }
        
        return MyCollection(implementations: values)
    }
}
