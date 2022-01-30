//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Eric Kim on 1/25/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    
    static var themes: Array<Theme> = [
        Theme(
            name: "Vehicles",
            emojis: ["🚗","🚌","🚠","⛴","🏍","🚨","🚟","💺","🚤","🛥","🛳","🚍","🚡","🛵","🚐","🚎","🏎", "🛺"],
            numberOfPairsOfCards: 5,
            color: "blue"
        ),
        Theme(
            name: "Hearts",
            emojis: ["❤️","🧡","💛","💚","💙","💜","🖤","🤍","🤎"],
            numberOfPairsOfCards: 7,
            color: "orange"
        ),
        Theme(
            name: "Games",
            emojis: ["🎲","♟","🎯","🎳","🎮","🎰","🧩","👾"],
            numberOfPairsOfCards: 4,
            color: "red"
        ),
        Theme(
            name: "Faces",
            emojis: ["😀","😃","😄","😆","🤣","😊","😎","🥸","🧐","🥰","😍","😤"],
            numberOfPairsOfCards: 10,
            color: "green"
        ),
        Theme(
            name: "Hands",
            emojis: ["🤲","👍","🤘","✌️","🦾","💪","👆","👋","🤝","👏","🤜","🤌"],
            numberOfPairsOfCards: 6,
            color: "purple"
        ),
        Theme(
            name: "Animals",
            emojis: ["🐶","🐱","🐯","🦁","🐮","🐸","🙈","🐹","🦊","🐼","🐧"],
            numberOfPairsOfCards: 8,
            color: "yellow"
        )
    ]

    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in
            theme.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String>
    
    private(set) var theme: Theme
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var color: Color  {
        switch theme.color {
        case "blue":
            return .blue
        case "orange":
            return .orange
        case "red":
            return .red
        case "green":
            return .green
        case "purple":
            return .purple
        case "yellow":
            return .yellow
        default:
            return .red
        }
    }
    
    var themeName: String {
        return theme.name
    }
    
    var score: Int {
        return model.score
    }
    
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
}
