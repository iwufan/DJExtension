//
//  DJGlobalMethods.swift
//  DJExtension
//
//  Created by David Jia on 16/8/2017.
//  Copyright © 2017 David Jia. All rights reserved.
//

import UIKit

// MARK: - init method
extension UIButton {
    
    /// quick way to create a button with image and background image
    convenience init (normalImage: UIImage? = nil, selectedImage: UIImage? = nil, backgroundImage: UIImage? = nil, selBgImage: UIImage? = nil) {
        
        self.init()
        
        setImage(normalImage, for: .normal)
        setImage(selectedImage, for: .selected)
        setBackgroundImage(backgroundImage, for: .normal)
        setBackgroundImage(selBgImage, for: .selected)
    }
    
    /// create a button with title/fontSize/TitleColor/bgColor
    convenience init (title: String, selTitle: String? = nil, fontSize: CGFloat, titleColor: UIColor, selTitleColor: UIColor? = nil, bgColor: UIColor = UIColor.clear, isBold: Bool = false, titleOffset: UIEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0))  {
        
        self.init()
        
        setTitle(title, for: .normal)
        setTitle(selTitle == nil ? title : selTitle, for: .selected)
        titleLabel?.font = isBold ? UIFont.boldSystemFont(ofSize: fontSize) : UIFont.systemFont(ofSize: fontSize)
        setTitleColor(titleColor, for: .normal)
        setTitleColor(selTitleColor == nil ? titleColor : selTitleColor, for: .selected)
        backgroundColor = bgColor
        titleEdgeInsets = titleOffset
    }
}

// MARK: - instance method
extension UIButton {

    func setup(title: String, selTitle: String? = nil, fontSize: CGFloat, titleColor: UIColor, selTitleColor: UIColor? = nil, bgColor: UIColor = UIColor.clear, isBold: Bool = false, titleOffset: UIEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)) {
        
        setTitle(title, for: .normal)
        setTitle(selTitle == nil ? title : selTitle, for: .selected)
        titleLabel?.font = isBold ? UIFont.boldSystemFont(ofSize: fontSize) : UIFont.systemFont(ofSize: fontSize)
        setTitleColor(titleColor, for: .normal)
        setTitleColor(selTitleColor, for: .selected)
        backgroundColor = bgColor
        titleEdgeInsets = titleOffset
    }
}
