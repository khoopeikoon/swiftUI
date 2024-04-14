//
//  memorizeGame.swift
//  Learning app 1
//
//  Created by Khoo Pei Koon on 12/4/24.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int) {
        cards = Array<Card>()
    }
    
    func choose(_ card: Card){
        
    }
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
