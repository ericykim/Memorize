//
//  ContentView.swift
//  Memorize
//
//  Created by Eric Kim on 1/18/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack{
            Text("\(game.themeName)")
            Text("Score: \(game.score)")
            
            
            //            ScrollView {
            //                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
            //                    ForEach(game.cards) { card in
            AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
                if card.isMatched && !card.isFaceUp {
                    Rectangle().opacity(0)
                } else {
                    CardView(card)
                        .padding(4)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            })
            
            //                    }
            //                }
            //            }
                .foregroundColor(game.color)
                .padding(.horizontal)
            
            Button {
                game.newGame()
            } label: {
                Text("New Game")
            }
        }
        
    }
    
}


struct CardView: View {
    private let card: EmojiMemoryGame.Card
    
    init (_ card: EmojiMemoryGame.Card) {
        self.card = card
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                    .padding(5)
                    .opacity(0.5)
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    .font(font(in: geometry.size))
                    .scaleEffect(scale(thatFits: geometry.size))

            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.7
        static let fontSize: CGFloat = 32
    }
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
        
    }
}
