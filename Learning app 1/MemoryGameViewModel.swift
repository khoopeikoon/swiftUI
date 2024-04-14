//
//  MemoryGameViewModel.swift
//  Learning app 1
//
//  Created by Khoo Pei Koon on 12/4/24.
//

import SwiftUI

class MemoryGameViewModel: ObservableObject {
    private static let emojis = ["🥲","🤔","🙄","🤣","🥹","🥳","🤩"]

    @Published private var model = MemoryGameViewModel.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 4) { pairIndex -> String in
            if emojis.indices.contains(pairIndex) {
                return MemoryGameViewModel.emojis[pairIndex]
            } else {
                return "🚫"
            }
        }
    }
    
    var cards:Array<MemoryGame<String>.Card> {
        return model.cards
    }

    // MARK: - Intents
    func shuffle(){
        model.shuffle()
    }
    func choose(_ card:MemoryGame<String>.Card){
        model.choose(card)
    }
}
