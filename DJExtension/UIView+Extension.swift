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

// MARK: - properties
extension UIView {

    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    /// get max y
    var maxY: CGFloat {

        get {
            return frame.origin.y + frame.size.height
        }
        set {
            frame.origin.y = newValue - frame.size.height
        }
    }
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
}
// MARK: - instance method
extension UIView {

    func addTopLine(color: UIColor = MW_LINE_COLOR, leftOffset: CGFloat = 0, righOffset: CGFloat = 0, height: CGFloat = 0.5) {
        
        let line = UIView(bgColor: color)
        
        addSubview(line)
        
        line.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(leftOffset)
            make.right.equalTo(self.snp.right).offset(righOffset)
            make.top.equalTo(self.snp.top)
            make.height.equalTo(height)
        }
    }
    
    func addBottomLine(color: UIColor = MW_LINE_COLOR, leftOffset: CGFloat = 0, righOffset: CGFloat = 0, height: CGFloat = 0.5) {
        
        let line = UIView(bgColor: color)
        
        addSubview(line)
        
        line.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(leftOffset)
            make.right.equalTo(self.snp.right).offset(righOffset)
            make.bottom.equalTo(self.snp.bottom)
            make.height.equalTo(height)
        }
    }
}

extension UIView {

    /// 移除所有子控件
    func removeAllSubviews() {
        
        subviews.forEach { (subView) in
            
            subView.removeFromSuperview()
        }
    }
    
    /// 获取父控制器
    func getParentViewController() -> UIViewController? {
    
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
