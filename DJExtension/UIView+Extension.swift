//
//  DJGlobalMethods.swift
//  DJExtension
//
//  Created by David Jia on 16/8/2017.
//  Copyright © 2017 David Jia. All rights reserved.
//

import UIKit

// MARK: - init method
extension UIView {
    
    /// quick way to create a button with background color
    convenience init (bgColor: UIColor) {
        
        self.init()
        
        backgroundColor = bgColor
    }
}

// MARK: - instance method
extension UIView {

    func dj_addTopLine(color: UIColor = dj_hexColor("e9e9e9"), leftOffset: CGFloat = 0, righOffset: CGFloat = 0, height: CGFloat = 0.5) {
        
        let line = UIView(bgColor: color)
        
        let lineWidth = bounds.width - leftOffset - righOffset
        
        line.frame = CGRect(x: leftOffset, y: 0, width: lineWidth, height: height)
        
        addSubview(line)
    }
    
    func dj_addBottomLine(color: UIColor = dj_hexColor("e9e9e9"), leftOffset: CGFloat = 0, righOffset: CGFloat = 0, height: CGFloat = 0.5) {
        
        let line = UIView(bgColor: color)
        line.tag = 100001
        addSubview(line)
        
        let lineWidth = bounds.width - leftOffset - righOffset
        let lineY = bounds.height - height
        
        line.frame = CGRect(x: leftOffset, y: lineY, width: lineWidth, height: height)
    }
    
    func dj_removeBottomLine() {
        
        subviews.forEach { (view) in
        
            if view.tag == 100001 {
                view.removeFromSuperview()
            }
        }
    }
}

extension UIView {
    /// set corner radius
    func dj_setCornerRadius(radius: CGFloat, borderWidth: CGFloat = 0.5, borderColor: UIColor) {
        
        layer.cornerRadius = radius
        layer.masksToBounds = true
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}

extension UIView {

    /// remove all subviews
    func dj_removeAllSubviews() {
        
        subviews.forEach { (subView) in
            
            subView.removeFromSuperview()
        }
    }
    
    /// get parent viewController
    func dj_getParentViewController() -> UIViewController? {
    
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
