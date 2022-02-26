//
//  Keyboard.swift
//  Wordle2
//
//  Created by Karen Mathes on 2/23/22.
//

import SwiftUI

struct Keyboard: View {
    @EnvironmentObject var dm: WordleDataModel
    var topRowArray = "QWERTYUIOP".map{ String($0) }
    var secondRowArray = "ASDFGHJKL".map{ String($0) }
    var thirdRowArray = "ZXCVBNM".map{ String($0) }
    var body: some View {
        VStack(spacing: 3) {
            HStack(spacing: 2) {
                ForEach(topRowArray, id: \.self) { letter in
                    LetterButtonViews(letter: letter)
                }
                .disabled(dm.disabledKeys)
                .opacity(dm.disabledKeys ? 0.6 : 1.0)
            }
            HStack(spacing: 2) {
                ForEach(secondRowArray, id: \.self) { letter in
                    LetterButtonViews(letter: letter)
                }
                .disabled(dm.disabledKeys)
                .opacity(dm.disabledKeys ? 0.6 : 1.0)
            }
            HStack(spacing: 2) {
                Button {
                    dm.enterWord()
                } label: {
                    Text("Enter")
                }
                .font(.system(size: 20))
                .frame(width: 60, height: 50)
                .foregroundColor(.primary)
                .background(Color.unused)
                .disabled(dm.currentWord.count < 5 || !dm.inPlay)
                .opacity((dm.currentWord.count < 5 || !dm.inPlay) ? 0.6 : 1.0)
                ForEach(thirdRowArray, id: \.self) { letter in
                    LetterButtonViews(letter: letter)
                }
                .disabled(dm.disabledKeys)
                .opacity(dm.disabledKeys ? 0.6 : 1.0)
                
                Button {
                    dm.removeLetterFromCurrentWord()
                } label: {
                    Image(systemName: "delete.left.fill")
                        .font(.system(size: 20, weight: .heavy))
                }
                .font(.system(size: 20))
                .frame(width: 40, height: 50)
                .foregroundColor(.primary)
                .background(Color.unused)
                .disabled(!dm.inPlay || dm.currentWord.count == 0)
                .opacity((!dm.inPlay || dm.currentWord.count == 0) ? 0.6 : 1.0)
            }
        }
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard()
            .environmentObject(WordleDataModel())
            .scaleEffect(Global.keyboardScale)
    }
}
