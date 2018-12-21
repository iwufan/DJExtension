//
//  DJGlobalMethods.swift
//  DJExtension
//
//  Created by David Jia on 16/8/2017.
//  Copyright © 2017 David Jia. All rights reserved.
//

import UIKit
import SnapKit

public let lineColor         = dj_hexColor("EDEDED")

// MARK: - init method
extension UIView {
    
    /// quick way to create a view with background color and super view
    @discardableResult
    public convenience init (backgroundColor: UIColor, superView: UIView, closure: (ConstraintMaker) -> Void) {
        
        self.init()
        
        self.backgroundColor = backgroundColor
        
        superView.addSubview(self)
        
        self.snp.makeConstraints(closure)
    }
    /// quick way to create a view with super view
    @discardableResult
    public convenience init (superView: UIView, closure: (ConstraintMaker) -> Void) {
        
        self.init()

        superView.addSubview(self)
        
        self.snp.makeConstraints(closure)
    }
    
}

// MARK: - instance method
extension UIView {

    public func dj_addTopLine(color: UIColor = lineColor, leftOffset: CGFloat = 0, rightOffset: CGFloat = 0, height: CGFloat = 0.5) {
        
        UIView(backgroundColor: color, superView: self) { (make) in
            make.left.equalTo(self.snp.left).offset(leftOffset)
            make.right.equalTo(self.snp.right).offset(-rightOffset)
            make.top.equalTo(self.snp.top)
            make.height.equalTo(height)
        }
    }
    
    public func dj_addBottomLine(color: UIColor = lineColor, leftOffset: CGFloat = 0, rightOffset: CGFloat = 0, height: CGFloat = 0.5) {
        
        let line = UIView(backgroundColor: color, superView: self) { (make) in
            make.left.equalTo(self.snp.left).offset(leftOffset)
            make.right.equalTo(self.snp.right).offset(-rightOffset)
            make.bottom.equalTo(self.snp.bottom)
            make.height.equalTo(height)
        }
        
        line.tag = 100001
    }
    
    public func dj_removeBottomLine() {
        
        subviews.forEach { (view) in
            if view.tag == 100001 {
                view.removeFromSuperview()
            }
        }
    }
    /// add blank view for iPhone X
    public func dj_addBlankView(isHasTopLine: Bool = false) {
        
        if dj_isIPhoneX() {
            
            let blankView = UIView(backgroundColor: djWhite, superView: self) { (make) in
                make.left.right.bottom.equalTo(self)
                make.height.equalTo(34)
            }
            
            if isHasTopLine {
                blankView.dj_addTopLine()
            }
        }
    }
}

extension UIView {
    /// set corner radius
    public func dj_setCornerRadius(radius: CGFloat, borderWidth: CGFloat = 0.5, borderColor: UIColor? = nil) {
        
        layer.cornerRadius = radius
        layer.masksToBounds = true
        
        if let color = borderColor {
            layer.borderWidth = borderWidth
            layer.borderColor = color.cgColor
        }
    }
}

extension UIView {
    
    // add shadow
    public func dj_addShadow() {
        
        layer.masksToBounds = false
        layer.shadowColor = djBlack.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 3
    }
}

extension UIView {

    /// remove all subviews
    public func dj_removeAllSubviews() {
        
        subviews.forEach { (subView) in
            
            subView.removeFromSuperview()
        }
    }
    
    /// get parent viewController
    public func dj_getParentViewController() -> UIViewController? {
    
        var next:UIView? = self
        repeat{
            if let nextResponder = next?.next, nextResponder.isKind(of: UIViewController.self) {
                return (nextResponder as! UIViewController)
            }
            next = next?.superview
        } while next != nil
        
        return nil
    }
}

extension UIView {
    // add tap gesture to a view
    public func dj_addTapGesture(_ target: Any?, action: Selector?) {

        addGestureRecognizer(UITapGestureRecognizer(target: target, action: action))
    }
}
