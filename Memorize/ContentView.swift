//
//  ContentView.swift
//  Memorize
//
//  Created by Eric Kim on 1/18/22.
//

import SwiftUI

struct ContentView: View {
    var vehicals = ["🚗","🚌","🚠","⛴","🏍","🚨","🚟","💺","🚤","🛥","🛳","🚍","🚡","🛵","🚐","🚎","🏎", "🛺"]
    var hearts = ["❤️","🧡","💛","💚","💙","💜","🖤","🤍","🤎"]
    var games = ["🎲","♟","🎯","🎳","🎮","🎰","🧩","👾"]
    
    @State var theme = 1
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            if theme == 1 {
                ScrollBody(emojiArray: vehicals)
            } else if theme == 2 {
                ScrollBody(emojiArray: hearts)
            } else {
                ScrollBody(emojiArray: games)
            }
            
            Spacer()
            HStack {
                theme1
                theme2
                theme3
            }
            .font(.title)
            .foregroundColor(.blue)
            .padding(.horizontal)
            
        }
        .padding(.horizontal)
        
        
    }
    
    var theme1: some View {
        VStack {
            Button{
                theme = 1
            } label: {
                Image(systemName: "airplane.circle")
            }
            Text("Vehicles")
                .font(.caption)
        }
        .padding(.horizontal)
    }
    
    var theme2: some View {
        VStack {
            Button{
                theme = 2
            } label: {
                Image(systemName: "heart")
            }
            Text("Hearts")
                .font(.caption)
        }
        .padding(.horizontal)
    }
    
    var theme3: some View {
        VStack {
            Button{
                theme = 3
            } label: {
                Image(systemName: "gamecontroller")
            }
            Text("Games")
                .font(.caption)
        }
        .padding(.horizontal)
    }
}

struct ScrollBody: View {
    var emojiCount = 8
    var emojiArray: [String]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(emojiArray[0..<emojiCount].shuffled(), id: \.self) { emoji in
                    CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
        .foregroundColor(.red)
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
.previewInterfaceOrientation(.portrait)
        ContentView()
            .preferredColorScheme(.light)
        
    }
}
