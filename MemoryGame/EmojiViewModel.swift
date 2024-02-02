//
//  EmojiViewModel.swift
//  MemoryGame
//
//  Created by นางสาวชลิศา ธรรมราช on 2/2/2567 BE.
//

import Foundation

class EmojiViewModel: ObservableObject {
    static let emojis = ["🥰", "🥳", "🥹", "😎", "🫢", "🙄", "😇", "😱", "🤧", "😋"]
    // let emojis: Array<String> =  ["🥰", "🥳", "🥹", "😎", "🫢"]
    
    // if something chage in this , it will be announced
    @Published private var model = MemoryGameModel<String>(numberOfPairsOfCards: emojis.count) {
        index in emojis[index]
    }
    
    var cards: [MemoryGameModel<String>.Card] { // .card
        return model.cards
    }
    
    func shuffle() { // .shuffle()
        model.shuffle()
    }
    
    func choose(_ card: MemoryGameModel<String>.Card) {
        model.choose(card)
    }
}
