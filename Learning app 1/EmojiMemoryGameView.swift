//
//  EmojiMemoryGameView.swift
//  Learning app 1
//
//  Created by Khoo Pei Koon on 10/4/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
   @ObservedObject var viewModel: MemoryGameViewModel
    
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    
    
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120),spacing: 0)], spacing: 0)
        {
            ForEach(viewModel.cards.indices,id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(.blue)
    }
}
struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius:15)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth:5)
                Text(card.content)
                    .font(.system(size:200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        }
    }
struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: MemoryGameViewModel())
    }
}
