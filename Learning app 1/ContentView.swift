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
            if isFaceUp {
                RoundedRectangle(cornerRadius: 15).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 15).strokeBorder(lineWidth:5)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
                Text("🥲").font(.largeTitle)
            } else {
                RoundedRectangle (cornerRadius:15)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
        })
    }
}

#Preview {
    ContentView()
}
