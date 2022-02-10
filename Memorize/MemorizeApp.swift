//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Eric Kim on 1/18/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
