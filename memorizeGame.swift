//
//  memorizeGame.swift
//  Learning app 1
//
//  Created by Khoo Pei Koon on 12/4/24.
//

import Foundation

struct MemoryGame,CardContent {
    var cards: Array<Card>
    
    func choose(card: Card){
        
    }
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
