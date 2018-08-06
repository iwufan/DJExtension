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
    convenience init (title: String, fontSize: CGFloat, color: UIColor, alignment: NSTextAlignment = .left, isBold: Bool = false) {
        
        self.init()
        
        text = title
        font = isBold ? UIFont.boldSystemFont(ofSize: fontSize) : UIFont.systemFont(ofSize: fontSize)
        textColor = color
        textAlignment = alignment
    }
}

// MARK: - instance method
extension UILabel {

    func setup(title: String, fontSize: CGFloat, color: UIColor, alignment: NSTextAlignment = .left, isBold: Bool = false ) {

        text = title
        font = isBold ? UIFont.boldSystemFont(ofSize: fontSize) : UIFont.systemFont(ofSize: fontSize)
        textColor = color
        textAlignment = alignment
    }
}
