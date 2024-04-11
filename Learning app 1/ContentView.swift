//
//  ContentView.swift
//  Learning app 1
//
//  Created by Khoo Pei Koon on 10/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .padding()
    }
}
struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack(content:{
            let base = RoundedRectangle(cornerRadius:15)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth:5)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Text("🥲").font(.largeTitle)
            } else {
                base.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
        })
    }
}

#Preview {
    ContentView()
}
