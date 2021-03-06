//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Eric Kim on 1/25/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    
    static var themes: Array<Theme> = [
        Theme(
            name: "Vehicles",
            emojis: ["๐","๐","๐ ","โด","๐","๐จ","๐","๐บ","๐ค","๐ฅ","๐ณ","๐","๐ก","๐ต","๐","๐","๐", "๐บ"],
            numberOfPairsOfCards: 5,
            color: "blue"
        ),
        Theme(
            name: "Hearts",
            emojis: ["โค๏ธ","๐งก","๐","๐","๐","๐","๐ค","๐ค","๐ค"],
            numberOfPairsOfCards: 7,
            color: "orange"
        ),
        Theme(
            name: "Games",
            emojis: ["๐ฒ","โ","๐ฏ","๐ณ","๐ฎ","๐ฐ","๐งฉ","๐พ"],
            numberOfPairsOfCards: 4,
            color: "red"
        ),
        Theme(
            name: "Faces",
            emojis: ["๐","๐","๐","๐","๐คฃ","๐","๐","๐ฅธ","๐ง","๐ฅฐ","๐","๐ค"],
            numberOfPairsOfCards: 10,
            color: "green"
        ),
        Theme(
            name: "Hands",
            emojis: ["๐คฒ","๐","๐ค","โ๏ธ","๐ฆพ","๐ช","๐","๐","๐ค","๐","๐ค","๐ค"],
            numberOfPairsOfCards: 6,
            color: "purple"
        ),
        Theme(
            name: "Animals",
            emojis: ["๐ถ","๐ฑ","๐ฏ","๐ฆ","๐ฎ","๐ธ","๐","๐น","๐ฆ","๐ผ","๐ง"],
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
    
    var cards: Array<Card> {
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
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
}

struct Previews_EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
