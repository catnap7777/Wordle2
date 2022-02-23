//
//  WordleDataModel.swift
//  Wordle2
//
//  Created by Karen Mathes on 2/22/22.
//

import SwiftUI

class WordleDataModel: ObservableObject {
    
    @Published var guesses: [Guess] = []
    
    var keyColors = [String : Color]()
    
    init() {
        newGame()
    }
    
    func newGame() {
        populateDefaults()
    }
    
    // MARK: - Setup
    func populateDefaults() {
        
        guesses = []
        for index in (0...5) {
            guesses.append(Guess(index: index))
        }
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        for char in letters {
            keyColors[String(char)] = .unused
        }
        
    }
    
    // MARK: - Game Play
    func addToCurrentWord(_ letter: String) {
        
        
    }
    
    func enterWord() {
        
        
    }
    
    func removeLetterFromCurrentWord() {
        
        
    }
    
    
    
}
