//
//  Guess.swift
//  Wordle2
//
//  Created by Karen Mathes on 2/22/22.
//


import SwiftUI

struct Guess {
    let index: Int
    var word = "     "
    var bgColors = [Color](repeating: .wrong, count: 5)
    //let bgColors2 = [UIColor](repeating: .systemBackground, count: 5)
    var cardFlipped = [Bool](repeating: false, count: 5)
    var guessLetters: [String] {
        word.map {String($0)}
    }
    
    //.. for share sheet
    //⬜🟩⬜🟨🟩
    var results: String {
        let tryColors: [Color : String] = [.misplaced : "🟨", .correct : "🟩", .wrong : "⬜"]
        //.. map items from the colors to the tryColors dictionary and join them together
        return bgColors.compactMap {tryColors[$0]}.joined(separator: "")
    }
    
   
}
