//
//  ContentView.swift
//  MemoryGame
//
//  Created by นางสาวชลิศา ธรรมราช on 2/2/2567 BE.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = EmojiViewModel()
    
    var body: some View {
        VStack{
            // V - Column, H - Row
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem()]){
                ForEach(viewModel.cards) { card in
                    CardView(card)
                        .aspectRatio(2/3, contentMode: .fit) // auto fix
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
            .foregroundColor(.purple)
            Spacer()
        }
        .padding()
        
    }
}

// id: \.self - create id

struct CardView: View {
    var card: MemoryGameModel<String>.Card
    
    init(_ card: MemoryGameModel<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)

            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
            }
            .opacity(card.isFaceUp ? 1 : 0)

            base.opacity(card.isFaceUp ? 0 : 1)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
