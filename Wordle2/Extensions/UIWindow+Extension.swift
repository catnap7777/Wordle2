//
//  UIWindow+Extension.swift
//  Wordle2
//
//  Created by Karen Mathes on 6/8/22.
//

import Foundation
import UIKit

extension UIWindow {
    
    static var key: UIWindow? {
        guard let scene = UIApplication.shared.connectedScenes.first,
              let windowSceneDelegate = scene.delegate as? UIWindowSceneDelegate,
              let window = windowSceneDelegate.window else {
            return nil
        }
        return window
    }
    
    
}
