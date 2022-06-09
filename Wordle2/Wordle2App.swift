//
//  Wordle2App.swift
//  Wordle2
//
//  Created by Karen Mathes on 2/22/22.
//

import SwiftUI

@main
struct Wordle2App: App {
    @StateObject var dm = WordleDataModel()
    @StateObject var csManager = ColorSchemeManager()
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(dm)
                .environmentObject(csManager)
                .onAppear {
                    csManager.applyColorScheme()
                }
        }
    }
}
