//
//  RootView.swift
//  MasterMessageiOSDuplicate
//
//  Created by Reuben on 27/11/2024.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var viewModel: RootViewModel
    
    var body: some View {
        Text("Hello, World!")

        Text(viewModel.string)
    }
}

#Preview {
    RootView(viewModel: RootViewModel())
}

class RootViewModel: ObservableObject {
    var string: String {
        return RootViewModel.f()
    }
    
    private static func f() -> String {
        let e1 = MasterMessageGameMove(move: CombinationGuess(combination: [.Red]), eventData: MasterMessageGameEventData(eventType: .Move, player: MasterMessagePlayer(id: UUID())))
        let e2 = MasterMessageGameEnd(eventData: MasterMessageGameEventData(eventType: .End, player: MasterMessagePlayer(id: UUID())))
        let es: [any Event] = [e1, e2]
        let j = JSONEncoder()
        
        var list: [String] = []
        
        for x in es {
            let string: String = String(data: try! j.encode(x), encoding: .utf8)!
            list.append(string)
        }
        
        return "[\(list.joined(separator: ","))]"
    }
}
