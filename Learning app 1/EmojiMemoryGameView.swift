//
//  EmojiMemoryGameView.swift
//  Learning app 1
//
//  Created by Khoo Pei Koon on 10/4/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel: MemoryGameViewModel = MemoryGameViewModel()
    
    var body: some View {
        ScrollView{
            cards
        }
        .padding()
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))])
        {
            ForEach(viewModel.cards.indices,id: \.self) { index in
                CardView(card: viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.blue)
    }
}
struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius:15)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth:5)
                Text(card.content).font(.largeTitle)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        }
    }
struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView()
    }
}
