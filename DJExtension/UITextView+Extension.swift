//
//  DJGlobalMethods.swift
//  DJExtension
//
//  Created by David Jia on 16/8/2017.
//  Copyright © 2017 David Jia. All rights reserved.
//

import UIKit

/// init method
extension UITextView {
    
    /// quick way to create a text view
    convenience init (textColor: UIColor, font: UIFont, keyboardType: UIKeyboardType = .default) {
        
        self.init()
        
        self.textColor = textColor
        self.font = font
        self.keyboardType = keyboardType
    }
}

extension UITextView {
    
    /// set properties
    func dj_setup(textColor: UIColor, font: UIFont, keyboardType: UIKeyboardType = .default) {
        
        self.textColor = textColor
        self.font = font
        self.keyboardType = keyboardType
    }
}
