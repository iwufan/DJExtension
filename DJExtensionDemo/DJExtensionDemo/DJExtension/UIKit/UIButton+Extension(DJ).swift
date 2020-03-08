//
//  DJGlobalMethods.swift
//  DJExtension
//
//  Created by David Jia on 16/8/2017.
//  Copyright © 2017 David Jia. All rights reserved.
//

import UIKit
import SnapKit

public var djButtonnExtensionTouchClosureKey = "djButtonnExtensionTouchClosureKey"
public typealias djTouchClosure = (UIButton) -> Void

// MARK: - init method
extension UIButton {
    
    public var touchClosure: djTouchClosure? {
        get {
            return objc_getAssociatedObject(self, &djButtonnExtensionTouchClosureKey) as? djTouchClosure
        }
        set {
            objc_setAssociatedObject(self, &djButtonnExtensionTouchClosureKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            self.addTarget(self, action: #selector(touchButton(_:)), for: .touchUpInside)
        }
    }
    /// create a button with images
    @discardableResult
    public convenience init (normalImage: UIImage? = nil, selectedImage: UIImage? = nil, backgroundImage: UIImage? = nil, selBgImage: UIImage? = nil, action: djTouchClosure? = nil) {
        
        self.init()
        
        setImage(normalImage, for: .normal)
        setImage(selectedImage, for: .selected)
        setBackgroundImage(backgroundImage, for: .normal)
        setBackgroundImage(selBgImage, for: .selected)
        
        if let action = action {
            touchClosure = action
        }
    }
    /// create a button with images and super view
    @discardableResult
    public convenience init (normalImage: UIImage? = nil, selectedImage: UIImage? = nil, backgroundImage: UIImage? = nil, selBgImage: UIImage? = nil, superView: UIView, layoutClosure: ((ConstraintMaker) -> Void), action: djTouchClosure? = nil) {
        
        self.init()
        
        setImage(normalImage, for: .normal)
        setImage(selectedImage, for: .selected)
        setBackgroundImage(backgroundImage, for: .normal)
        setBackgroundImage(selBgImage, for: .selected)
    
        superView.addSubview(self)
        self.snp.makeConstraints(layoutClosure)
        
        if let action = action {
            touchClosure = action
        }
    }
    
    /// create a button with title/fontSize/TitleColor/selTitleColor/bgColor
    @discardableResult
    public convenience init (title: String, selTitle: String? = nil, titleFont: UIFont, titleColor: UIColor, selTitleColor: UIColor? = nil, bgColor: UIColor = UIColor.clear, titleOffset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), action: djTouchClosure? = nil)  {

        self.init()
        
        setTitle(title, for: .normal)
        setTitle(selTitle == nil ? title : selTitle, for: .selected)
        titleLabel?.font = titleFont
        setTitleColor(titleColor, for: .normal)
        setTitleColor(selTitleColor == nil ? titleColor : selTitleColor, for: .selected)
        backgroundColor = bgColor
        titleEdgeInsets = titleOffset
        
        if let action = action {
            touchClosure = action
        }
    }
    
    /// create a button with title/fontSize/TitleColor/selTitleColor/bgColor and super view
    @discardableResult
    public convenience init (title: String, selTitle: String? = nil, titleFont: UIFont, titleColor: UIColor, selTitleColor: UIColor? = nil, bgColor: UIColor = UIColor.clear, titleOffset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), superView: UIView, layoutClosure: ((ConstraintMaker) -> Void), action: djTouchClosure? = nil)  {
        
        self.init()
        
        setTitle(title, for: .normal)
        setTitle(selTitle == nil ? title : selTitle, for: .selected)
        titleLabel?.font = titleFont
        setTitleColor(titleColor, for: .normal)
        setTitleColor(selTitleColor == nil ? titleColor : selTitleColor, for: .selected)
        backgroundColor = bgColor
        titleEdgeInsets = titleOffset
        
        superView.addSubview(self)
        self.snp.makeConstraints(layoutClosure)
        
        if let action = action {
            touchClosure = action
        }
    }
    
    /// create a button with title and image
    @discardableResult
    public convenience init (title: String, titleFont: UIFont, titleColor: UIColor, selTitleColor: UIColor? = nil, normalImage: UIImage, selectedImage: UIImage? = nil, titleOffset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), imageOffset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), action: djTouchClosure? = nil)  {
        
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
            touchClosure = action
        }
    }
    
    /// create a button with title and image and super view
    @discardableResult
    public convenience init (title: String, titleFont: UIFont, titleColor: UIColor, selTitleColor: UIColor? = nil, normalImage: UIImage, selectedImage: UIImage? = nil, titleOffset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), imageOffset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), superView: UIView, closure: ((ConstraintMaker) -> Void), action: djTouchClosure? = nil)  {
        
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
        
        superView.addSubview(self)
        self.snp.makeConstraints(closure)
        
        if let action = action {
            touchClosure = action
        }
    }
}

// MARK: - instance method
extension UIButton {
    
    // setup a button with titles/colors
    public func dj_setup(title: String, selTitle: String? = nil, titleFont: UIFont, titleColor: UIColor, selTitleColor: UIColor? = nil, bgColor: UIColor = UIColor.clear, isBold: Bool = false, titleOffset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), action: djTouchClosure? = nil) {
        
        setTitle(title, for: .normal)
        setTitle(selTitle == nil ? title : selTitle, for: .selected)
        titleLabel?.font = titleFont
        setTitleColor(titleColor, for: .normal)
        setTitleColor(selTitleColor, for: .selected)
        backgroundColor = bgColor
        titleEdgeInsets = titleOffset
        
        if let action = action {
            touchClosure = action
        }
    }
    // setup a button with titles/colors and super view
    public func dj_setup(title: String, selTitle: String? = nil, titleFont: UIFont, titleColor: UIColor, selTitleColor: UIColor? = nil, bgColor: UIColor = UIColor.clear, isBold: Bool = false, titleOffset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), superView: UIView, closure: ((ConstraintMaker) -> Void), action: djTouchClosure? = nil) {
        
        setTitle(title, for: .normal)
        setTitle(selTitle == nil ? title : selTitle, for: .selected)
        titleLabel?.font = titleFont
        setTitleColor(titleColor, for: .normal)
        setTitleColor(selTitleColor, for: .selected)
        backgroundColor = bgColor
        titleEdgeInsets = titleOffset
        
        superView.addSubview(self)
        self.snp.makeConstraints(closure)
        
        if let action = action {
            touchClosure = action
        }
    }
    
    /// setup a button with images
    public func dj_setup(normalImage: UIImage? = nil, selectedImage: UIImage? = nil, backgroundImage: UIImage? = nil, selBgImage: UIImage? = nil, action: djTouchClosure? = nil) {
        
        setImage(normalImage, for: .normal)
        setImage(selectedImage, for: .selected)
        setBackgroundImage(backgroundImage, for: .normal)
        setBackgroundImage(selBgImage, for: .selected)
        
        if let action = action {
            touchClosure = action
        }
    }
    
    /// setup a button with images and super view
    public func dj_setup(normalImage: UIImage? = nil, selectedImage: UIImage? = nil, backgroundImage: UIImage? = nil, selBgImage: UIImage? = nil, superView: UIView, closure: ((ConstraintMaker) -> Void), action: djTouchClosure? = nil) {
        
        setImage(normalImage, for: .normal)
        setImage(selectedImage, for: .selected)
        setBackgroundImage(backgroundImage, for: .normal)
        setBackgroundImage(selBgImage, for: .selected)
        
        superView.addSubview(self)
        self.snp.makeConstraints(closure)
        
        if let action = action {
            touchClosure = action
        }
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

extension UIButton {
    
    @objc private func touchButton(_ button: UIButton) {
        
        if let closure = touchClosure {
            closure(button)
        }
    }
}
