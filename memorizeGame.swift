//
//  memorizeGame.swift
//  Learning app 1
//
//  Created by Khoo Pei Koon on 12/4/24.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards
        
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            let faceUpCardIndices = /*[Int]()*/ cards.indices.filter {index in cards[index].isFaceUp}
            /* chunk after [int] replaces chunk below
            for index in cards.indices {
                if cards[index].isFaceUp {
                    faceUpCardIndices.append(index)
                }
            }
             */
            
            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
/*       chunk above replaces the chunk below
               if faceUpCardIndices.count == 1 {
                return faceUpCardIndices.first
            } else {
                return nil
            }
        */}
        set {
            return cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) }
            /*
            for index in cards.indices {
                if index == newValue {
                    cards[index].isFaceUp = true
                } else {
                    cards[index].isFaceUp = false
                }
            }*/
        }
    }
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}){
            
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched{
                
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex] .isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                    /* removing this because of the code in the car of indexOfTheOneAndOnly above indexOfTheOneAndOnlyFaceUpCard = nil */
                } else {
                    for index in cards.indices{
                        cards[index].isFaceUp = false
                    }
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
         /*   cards[chosenIndex].isFaceUp.toggle()
            print ("chose \(card)") */
        }
    }
    
/*   private func index(of card: Card) -> Int? {
        for index in cards.indices{
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }*/
    mutating func shuffle(){
        cards.shuffle()
        print(cards)
    }
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible{
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        var id: String
        
        var debugDescription: String{
            "\(id):\(content)\(isFaceUp ? "up" : "down")\(isMatched ? "matched" : "")"
        }
        
    }
}
extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
