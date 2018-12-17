//
//  DJGlobalMethods.swift
//  DJExtension
//
//  Created by David Jia on 16/8/2017.
//  Copyright © 2017 David Jia. All rights reserved.
//

import UIKit
import SnapKit

// MARK: - init method
extension UILabel {
    
    /// quick way to create a label with super view
    @discardableResult
    public convenience init (text: String, font: UIFont, color: UIColor, alignment: NSTextAlignment = .left, lineCount: NSInteger = 1, superView: UIView, closure: (ConstraintMaker) -> Void) {
        
        self.init()
        
        self.text = text
        self.font = font
        textColor = color
        textAlignment = alignment
        numberOfLines = lineCount
        
        superView.addSubview(self)
        
        self.snp.makeConstraints(closure)
    }
    
}

// MARK: - instance method
extension UILabel {

    // quick way to setup a label with super view
    public func dj_setup(text: String, font: UIFont, color: UIColor, alignment: NSTextAlignment = .left, lineCount: NSInteger = 1, superView: UIView? = nil, closure: ((ConstraintMaker) -> Void)? = nil) {
        
        self.text = text
        self.font = font
        textColor = color
        textAlignment = alignment
        numberOfLines = lineCount
        
        guard let superView = superView, let closure = closure else {
            return
        }
        
        superView.addSubview(self)
        
        self.snp.makeConstraints(closure)
    }
}
