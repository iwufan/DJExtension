//
//  DJGlobalMethods.swift
//  DJExtension
//
//  Created by David Jia on 16/8/2017.
//  Copyright © 2017 David Jia. All rights reserved.
//

import UIKit
import SnapKit

/// init method
extension UITextView {
    
    /// quick way to create a text view with super view
    @discardableResult
    public convenience init (textColor: UIColor, font: UIFont, keyboardType: UIKeyboardType = .default, superView: UIView? = nil, closure: ((ConstraintMaker) -> Void)? = nil) {
        
        self.init()
        
        self.textColor = textColor
        self.font = font
        self.keyboardType = keyboardType
        
        if let sView = superView {
            sView.addSubview(self)
            
            if let closure = closure {
                self.snp.makeConstraints(closure)
            }
        }
    }
}

extension UITextView {
    /// quick way to setup a text view with super view
    public func dj_setup(textColor: UIColor, font: UIFont, keyboardType: UIKeyboardType = .default, superView: UIView?, closure: ((ConstraintMaker) -> Void)?) {
        
        self.textColor = textColor
        self.font = font
        self.keyboardType = keyboardType
        
        if let sView = superView {
            sView.addSubview(self)
            
            if let closure = closure {
                self.snp.makeConstraints(closure)
            }
        }
    }
}
