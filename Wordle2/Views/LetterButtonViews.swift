//
//  LetterButtonViews.swift
//  Wordle2
//
//  Created by Karen Mathes on 2/23/22.
//

import SwiftUI

struct LetterButtonViews: View {
    @EnvironmentObject var dm: WordleDataModel
    var letter: String
    var body: some View {
        Button {
            dm.addToCurrentWord(letter)
        } label: {
            Text(letter)
                .font(.system(size:20))
                .frame(width: 35, height: 50)
                .background(dm.keyColors[letter])
                .foregroundColor(.primary)
        }
        
    }
}

struct LetterButtonViews_Previews: PreviewProvider {
    static var previews: some View {
        LetterButtonViews(letter: "L")
            .environmentObject(WordleDataModel())
    }
}
