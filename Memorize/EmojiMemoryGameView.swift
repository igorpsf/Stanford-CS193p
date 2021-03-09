//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Igor Postnikov on 3/1/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards)  { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
            }
                .padding(5)
        }
        
            .padding()
            .foregroundColor(Color.orange)
        
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View{
        GeometryReader{ geometry in
            body(for: geometry.size)

        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngel: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                    .padding(5).opacity(0.4)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    // MARK: Drawing Canstants
    

    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.65
    }
    
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}

