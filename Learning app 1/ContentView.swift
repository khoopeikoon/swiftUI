//
//  ContentView.swift
//  Learning app 1
//
//  Created by Khoo Pei Koon on 10/4/24.
//

import SwiftUI

struct ContentView: View {
    var viewModel: MemoryGameViewModel
    
    let emojis: Array<String> = ["🥲","🤔","🙄","🤣","🥹","🥳","🤩"]
    @State var cardCount: Int = 4
    var body: some View {
        ScrollView{
            cards
        }
        .padding()
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))])
        {
            ForEach(emojis.indices,id: \.self) { index in
                CardView(content:emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.blue)
    }
}
struct CardView: View {
    let content:String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius:15)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth:5)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
