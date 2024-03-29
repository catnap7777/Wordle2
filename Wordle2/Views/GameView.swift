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
    @State var showSettings = false
    @State var showHelp = false
    var body: some View {
        ZStack {
        NavigationView {
            VStack {
                //.. from video 9 for weird ipod touch issue
                if Global.screenHeight < 600 {
                    Text("")
                }
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
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    //.. display a "new" button on toolbar after game is over so user can start a new game
                    HStack {
                        if !dm.inPlay {
                            Button {
                                dm.newGame()
                            } label: {
                                Text("New")
                                    .foregroundColor(.primary)
                            }
                            .buttonStyle(.bordered)
                            .tint(.purple)
                            .buttonBorderShape(.roundedRectangle(radius: 25))
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.purple, lineWidth: 3))
                        }
                        //}
                        Button {
                            showHelp.toggle()
                        } label: {
                            Image(systemName: "questionmark.circle")
                        }
                    }
                }
                ToolbarItem(placement: ToolbarItemPlacement.principal) {
                    Text("KAM WORDLE")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(dm.hardMode ? Color(.systemRed) : .correct)
                    //.. so KAM WORDLE title doesn't get truncated when "new" button for new game shows up
                        .minimumScaleFactor(0.5)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
                            withAnimation {
                                dm.currentStat = Statistic.loadStat()
                                dm.showStats.toggle()
                            }
                        } label: {
                            Image(systemName: "chart.bar")
                        }
                        Button {
                            showSettings.toggle()
                        } label: {
                            Image(systemName: "gearshape.fill")
                        }
                    }
                }
            }
            .sheet(isPresented: $showSettings) {
                SettingsView()
            }
            
        }
            if dm.showStats {
                StatsView()
            }
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showHelp) {
            HelpView()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(WordleDataModel())
    }
}
