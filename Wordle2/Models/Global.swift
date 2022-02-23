//
//  Global.swift
//  Wordle2
//
//  Created by Karen Mathes on 2/22/22.
//

import UIKit

enum Global {

    static var screenWidth: CGFloat {
        UIScreen.main.bounds.size.width
    }
    
    static var screenHeight: CGFloat {
        UIScreen.main.bounds.size.height
    }
    
    static var minDemension: CGFloat {
        min(screenWidth, screenHeight)
    }
    
    static var boardWidth: CGFloat {
        switch minDemension {
        case 0...320:           //.. up to and including ipod touch
            return screenWidth - 55
        case 321...430:         //.. iPhones
            return screenWidth - 50
        case 431...1000:        //.. smaller iPads
            return 350
        default:                //.. everything larger (iPads)
            return 500
        }
    }
    
}
