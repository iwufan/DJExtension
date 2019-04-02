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
extension UIButton {
    
    /// create a button with images
    @discardableResult
    public convenience init (normalImage: UIImage? = nil, selectedImage: UIImage? = nil, backgroundImage: UIImage? = nil, selBgImage: UIImage? = nil, target: Any? = nil, action: Selector? = nil) {
        
        self.init()
        
        setImage(normalImage, for: .normal)
        setImage(selectedImage, for: .selected)
        setBackgroundImage(backgroundImage, for: .normal)
        setBackgroundImage(selBgImage, for: .selected)
        
        if let action = action {
            addTarget(target, action: action, for: .touchUpInside)
        }
    }
    /// create a button with images and super view
    @discardableResult
    public convenience init (normalImage: UIImage? = nil, selectedImage: UIImage? = nil, backgroundImage: UIImage? = nil, selBgImage: UIImage? = nil, target: Any? = nil, action: Selector? = nil, superView: UIView, closure: ((ConstraintMaker) -> Void)) {
        
        self.init()
        
        setImage(normalImage, for: .normal)
        setImage(selectedImage, for: .selected)
        setBackgroundImage(backgroundImage, for: .normal)
        setBackgroundImage(selBgImage, for: .selected)
    
        if let action = action {
            addTarget(target, action: action, for: .touchUpInside)
        }
        
        superView.addSubview(self)
        self.snp.makeConstraints(closure)
    }
    
    /// create a button with title/fontSize/TitleColor/selTitleColor/bgColor
    @discardableResult
    public convenience init (title: String, selTitle: String? = nil, titleFont: UIFont, titleColor: UIColor, selTitleColor: UIColor? = nil, bgColor: UIColor = UIColor.clear, titleOffset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), target: Any? = nil, action: Selector? = nil)  {
        
        self.init()
        
        setTitle(title, for: .normal)
        setTitle(selTitle == nil ? title : selTitle, for: .selected)
        titleLabel?.font = titleFont
        setTitleColor(titleColor, for: .normal)
        setTitleColor(selTitleColor == nil ? titleColor : selTitleColor, for: .selected)
        backgroundColor = bgColor
        titleEdgeInsets = titleOffset
        
        if let action = action {
            addTarget(target, action: action, for: .touchUpInside)
        }
    }
    
    /// create a button with title/fontSize/TitleColor/selTitleColor/bgColor and super view
    @discardableResult
    public convenience init (title: String, selTitle: String? = nil, titleFont: UIFont, titleColor: UIColor, selTitleColor: UIColor? = nil, bgColor: UIColor = UIColor.clear, titleOffset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), target: Any? = nil, action: Selector? = nil, superView: UIView, closure: ((ConstraintMaker) -> Void))  {
        
        self.init()
        
        setTitle(title, for: .normal)
        setTitle(selTitle == nil ? title : selTitle, for: .selected)
        titleLabel?.font = titleFont
        setTitleColor(titleColor, for: .normal)
        setTitleColor(selTitleColor == nil ? titleColor : selTitleColor, for: .selected)
        backgroundColor = bgColor
        titleEdgeInsets = titleOffset
        
        if let action = action {
            addTarget(target, action: action, for: .touchUpInside)
        }

        superView.addSubview(self)
        self.snp.makeConstraints(closure)
    }
    
    /// create a button with title and image
    @discardableResult
    public convenience init (title: String, titleFont: UIFont, titleColor: UIColor, selTitleColor: UIColor? = nil, normalImage: UIImage, selectedImage: UIImage? = nil, titleOffset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), imageOffset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), target: Any? = nil, action: Selector? = nil)  {
        
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
        
        if let action = action {
            addTarget(target, action: action, for: .touchUpInside)
        }
    }
    
    /// create a button with title and image and super view
    @discardableResult
    public convenience init (title: String, titleFont: UIFont, titleColor: UIColor, selTitleColor: UIColor? = nil, normalImage: UIImage, selectedImage: UIImage? = nil, titleOffset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), imageOffset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), target: Any? = nil, action: Selector? = nil, superView: UIView, closure: ((ConstraintMaker) -> Void))  {
        
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
        
        if let action = action {
            addTarget(target, action: action, for: .touchUpInside)
        }
        
        superView.addSubview(self)
        self.snp.makeConstraints(closure)
    }
}

// MARK: - instance method
extension UIButton {
    
    // setup a button with titles/colors
    public func dj_setup(title: String, selTitle: String? = nil, titleFont: UIFont, titleColor: UIColor, selTitleColor: UIColor? = nil, bgColor: UIColor = UIColor.clear, isBold: Bool = false, titleOffset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), target: Any? = nil, action: Selector? = nil) {
        
        setTitle(title, for: .normal)
        setTitle(selTitle == nil ? title : selTitle, for: .selected)
        titleLabel?.font = titleFont
        setTitleColor(titleColor, for: .normal)
        setTitleColor(selTitleColor, for: .selected)
        backgroundColor = bgColor
        titleEdgeInsets = titleOffset
        
        if let action = action {
            addTarget(target, action: action, for: .touchUpInside)
        }
    }
    // setup a button with titles/colors and super view
    public func dj_setup(title: String, selTitle: String? = nil, titleFont: UIFont, titleColor: UIColor, selTitleColor: UIColor? = nil, bgColor: UIColor = UIColor.clear, isBold: Bool = false, titleOffset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), target: Any? = nil, action: Selector? = nil, superView: UIView, closure: ((ConstraintMaker) -> Void)) {
        
        setTitle(title, for: .normal)
        setTitle(selTitle == nil ? title : selTitle, for: .selected)
        titleLabel?.font = titleFont
        setTitleColor(titleColor, for: .normal)
        setTitleColor(selTitleColor, for: .selected)
        backgroundColor = bgColor
        titleEdgeInsets = titleOffset
        
        if let action = action {
            addTarget(target, action: action, for: .touchUpInside)
        }
        
        superView.addSubview(self)
        self.snp.makeConstraints(closure)
    }
    
    /// setup a button with images
    public func dj_setup(normalImage: UIImage? = nil, selectedImage: UIImage? = nil, backgroundImage: UIImage? = nil, selBgImage: UIImage? = nil, target: Any? = nil, action: Selector? = nil) {
        
        setImage(normalImage, for: .normal)
        setImage(selectedImage, for: .selected)
        setBackgroundImage(backgroundImage, for: .normal)
        setBackgroundImage(selBgImage, for: .selected)
        
        if let action = action {
            addTarget(target, action: action, for: .touchUpInside)
        }
    }
    
    /// setup a button with images and super view
    public func dj_setup(normalImage: UIImage? = nil, selectedImage: UIImage? = nil, backgroundImage: UIImage? = nil, selBgImage: UIImage? = nil, target: Any? = nil, action: Selector? = nil, superView: UIView, closure: ((ConstraintMaker) -> Void)) {
        
        setImage(normalImage, for: .normal)
        setImage(selectedImage, for: .selected)
        setBackgroundImage(backgroundImage, for: .normal)
        setBackgroundImage(selBgImage, for: .selected)
        
        if let action = action {
            addTarget(target, action: action, for: .touchUpInside)
        }
        
        superView.addSubview(self)
        self.snp.makeConstraints(closure)
    }
    
    public func dj_setTitle(_ title: String, state: State = .normal) {
        
        setTitle(title, for: state)
    }
    
    public func dj_setImage(_ name: String, state: State = .normal) {
        
        setImage(dj_image(name), for: state)
    }
    
    /// setup a button with target and action
    public func dj_addTarget(_ target: Any?, action: Selector) {
        
        addTarget(target, action: action, for: .touchUpInside)
    }
}
