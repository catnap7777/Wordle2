//
//  UIColor+NewColor.swift
//  Wordle2
//
//  Created by Karen Mathes on 2/22/22.
//

import SwiftUI

extension UIColor {
    
        static var wrong: UIColor {
            UIColor(named: "wrong")!
        }
        static var misplaced: UIColor {
            UIColor(named: "misplaced")!
        }
        static var correct: UIColor {
            UIColor(named: "correct")!
        }
        static var unused: UIColor {
            UIColor(named: "unused")!
        }
        static var systemBackground: UIColor {
            UIColor(.systemBackground)
        }
   
}
