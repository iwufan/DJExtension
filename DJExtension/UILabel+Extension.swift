//
//  DJGlobalMethods.swift
//  DJExtension
//
//  Created by David Jia on 16/8/2017.
//  Copyright © 2017 David Jia. All rights reserved.
//

import UIKit

// MARK: - init method
extension UILabel {
    
    /// quick way to create a label
    convenience init (text: String, font: UIFont, color: UIColor, alignment: NSTextAlignment = .left, lineCount: NSInteger = 1) {
        
        self.init()
        
        self.text = text
        self.font = font
        textColor = color
        textAlignment = alignment
        numberOfLines = lineCount
    }
    
}

// MARK: - instance method
extension UILabel {

    func dj_setup(text: String, font: UIFont, color: UIColor, alignment: NSTextAlignment = .left, lineCount: NSInteger = 1) {

        self.text = text
        self.font = font
        textColor = color
        textAlignment = alignment
        numberOfLines = lineCount
    }
}
