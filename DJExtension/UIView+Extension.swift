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

    func dj_addTopLine(color: UIColor = cmLineColor, leftOffset: CGFloat = 0, rightOffset: CGFloat = 0, height: CGFloat = 0.5) {
        
        let line = UIView(bgColor: color)
        
        addSubview(line)
        
        line.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(leftOffset)
            make.right.equalTo(self.snp.right).offset(-rightOffset)
            make.top.equalTo(self.snp.top)
            make.height.equalTo(height)
        }
    }
    
    func dj_addBottomLine(color: UIColor = cmLineColor, leftOffset: CGFloat = 0, rightOffset: CGFloat = 0, height: CGFloat = 0.5) {
        
        let line = UIView(bgColor: color)
        line.tag = 100001
        
        addSubview(line)
        
        line.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(leftOffset)
            make.right.equalTo(self.snp.right).offset(-rightOffset)
            make.bottom.equalTo(self.snp.bottom)
            make.height.equalTo(height)
        }
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
