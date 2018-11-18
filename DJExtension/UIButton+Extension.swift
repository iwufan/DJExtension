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
    convenience init (normalImage: UIImage? = nil, selectedImage: UIImage? = nil, backgroundImage: UIImage? = nil, selBgImage: UIImage? = nil, target: Any? = nil, action: Selector? = nil) {
        
        self.init()
        
        setImage(normalImage, for: .normal)
        setImage(selectedImage, for: .selected)
        setBackgroundImage(backgroundImage, for: .normal)
        setBackgroundImage(selBgImage, for: .selected)
        
        guard let action = action else {
            return
        }
        addTarget(target, action: action, for: .touchUpInside)
    }
    
    /// create a button with title/fontSize/TitleColor/bgColor
    convenience init (title: String, selTitle: String? = nil, titleFont: UIFont, titleColor: UIColor, selTitleColor: UIColor? = nil, bgColor: UIColor = UIColor.clear, titleOffset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), target: Any? = nil, action: Selector? = nil)  {
        
        self.init()
        
        setTitle(title, for: .normal)
        setTitle(selTitle == nil ? title : selTitle, for: .selected)
        titleLabel?.font = titleFont
        setTitleColor(titleColor, for: .normal)
        setTitleColor(selTitleColor == nil ? titleColor : selTitleColor, for: .selected)
        backgroundColor = bgColor
        titleEdgeInsets = titleOffset
        
        guard let action = action else {
            return
        }
        addTarget(target, action: action, for: .touchUpInside)
    }
    
    /// create a button with title and image
    convenience init (title: String, titleFont: UIFont, titleColor: UIColor, selTitleColor: UIColor? = djRed, normalImage: UIImage, selectedImage: UIImage? = nil, titleOffset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), imageOffset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), target: Any? = nil, action: Selector? = nil)  {
        
        self.init()
        
        setTitle(title, for: .normal)
        titleLabel?.font = titleFont
        setTitleColor(titleColor, for: .normal)
        setTitleColor(selTitleColor == nil ? titleColor : selTitleColor, for: .selected)
        setImage(normalImage, for: .normal)
        
        titleEdgeInsets = titleOffset
        imageEdgeInsets = imageOffset
        
        if selectedImage != nil {
            setImage(selectedImage, for: .selected)
        }
        
        guard let action = action else {
            return
        }
        addTarget(target, action: action, for: .touchUpInside)
    }
}

// MARK: - instance method
extension UIButton {

    func dj_setup(title: String, selTitle: String? = nil, titleFont: UIFont, titleColor: UIColor, selTitleColor: UIColor? = nil, bgColor: UIColor = UIColor.clear, isBold: Bool = false, titleOffset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), target: Any? = nil, action: Selector? = nil) {
        
        setTitle(title, for: .normal)
        setTitle(selTitle == nil ? title : selTitle, for: .selected)
        titleLabel?.font = titleFont
        setTitleColor(titleColor, for: .normal)
        setTitleColor(selTitleColor, for: .selected)
        backgroundColor = bgColor
        titleEdgeInsets = titleOffset
        
        guard let action = action else {
            return
        }
        addTarget(target, action: action, for: .touchUpInside)
    }
}
