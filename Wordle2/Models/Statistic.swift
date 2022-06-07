//
//  Statistic.swift
//  Wordle2
//
//  Created by Karen Mathes on 6/7/22.
//

import Foundation

struct Statistic: Codable {
    //.. frequencies of times successful / wins
    var frequencies = [Int](repeating: 0, count: 6)
    //.. number of games played
    var games = 0
    //.. how many games won in a row
    var streak = 0
    //.. maximum consecutive times in a row won
    var maxStreak = 0
    
    //.. compute number of wins by summing up frequencies using reduce starting at zero
    var wins: Int {
        frequencies.reduce(0, +)
    }
    
    //.. func to save our current stats to userdefaults... and since Statistic conforms to codable, we can use a Json encoder to do that
    func saveStat() {
        if let encoded = try? JSONEncoder().encode(self) {
            UserDefaults.standard.set(encoded, forKey: "Stat")
        }
    }
    
    //.. static function that returns a statistic
    static func loadStat() -> Statistic {
        //.. retrieve from userdefaults the data for key "Stat". If unsuccessful, you never had stats before so just return a new Statistic object
        if let savedStat = UserDefaults.standard.object(forKey: "Stat") as? Data {
            //.. try to use JSON decoder to decode the data that was returned.  If successful, return currentStat... otherwise, return a new Statistic object (ie. you didn't have any stats yet)
            if let currentStat = try? JSONDecoder().decode(Statistic.self, from: savedStat) {
                return currentStat
            } else {
                return Statistic()
            }
        } else {
            return Statistic()
        }
    }
    
    //.. function to update stats... must be a mutating function because by default, you can't mutate properties of a struct.
    mutating func update(win: Bool, index: Int? = nil) {
        games += 1
        //.. increase streak only if a win
        streak = win ? streak + 1 : 0
        if win {
            frequencies[index!] += 1
            maxStreak = max(maxStreak, streak)
        }
        saveStat()
        
    }
    
    
    
}
