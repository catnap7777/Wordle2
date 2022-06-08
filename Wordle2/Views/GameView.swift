//
//  GameView.swift
//  Wordle2
//
//  Created by Karen Mathes on 2/22/22.
//



//***** don't forget to make sure that the simulator has settings>general>dictionary set!!!!!!! Otherwise, all words will be invalid

import SwiftUI

struct GameView: View {
    @EnvironmentObject var dm: WordleDataModel
    var body: some View {
        ZStack {
        NavigationView {
            VStack {
                Spacer()
                VStack(spacing: 3) {
                    ForEach(0...5, id: \.self) { index in
                        GuessView(guess: $dm.guesses[index])
                            .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[index])))
                    }
                }
                .frame(width: Global.boardWidth, height: 6 * Global.boardWidth / 5)
                Spacer()
                Keyboard()
                    .scaleEffect(Global.keyboardScale)
                    .padding(.top)
                Spacer()
            }
            .disabled(dm.showStats)
            .navigationViewStyle(.stack)
            .navigationBarTitleDisplayMode(.inline)
            .disabled(dm.showStats)
            //.. need iOS15 for this
            .overlay(alignment: .top) {
                if let toastText = dm.toastText {
                    ToastView(toastText: toastText)
                        .offset(y: 20)
                }
            }
            //        Text("Hello, world!")
            //            .padding()
            //            .navigationTitle("WORDLE")
            //            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    //.. display a "new" button on toolbar after game is over so user can start a new game
                    HStack {
                        if !dm.inPlay {
                            Button {
                                dm.newGame()
                            } label: {
                                Text("New")
                                    .padding()
                                    .foregroundColor(.primary)
                                    .background(Color.yellow)
                            }
                        }
                    }
                    Button {
                        
                    } label: {
                        Image(systemName: "questionmark.circle")
                    }
                }
                ToolbarItem(placement: ToolbarItemPlacement.principal) {
                    Text("KAM WORDLE")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.correct)
                }
                
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    HStack {
                        Button {
                            withAnimation {
                                dm.showStats.toggle()
                            }
                        } label: {
                            Image(systemName: "chart.bar")
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "gearshape.fill")
                        }
                    }
                }
            }
            
        }
            if dm.showStats {
                StatsView()
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(WordleDataModel())
    }
}
