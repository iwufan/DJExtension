//
//  DJGlobalMethods.swift
//  DJExtension
//
//  Created by David Jia on 16/8/2017.
//  Copyright © 2017 David Jia. All rights reserved.
//

import UIKit

// MARK: - class method
extension UIImage {

    /// get no render image
    class func originalImage(name: String) -> UIImage {
        
        guard let image = UIImage(named: name) else {
            return UIImage()
        }

        return image.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
    }
}

// MARK: - instance method
extension UIImage {

    /// get image with corner radius
    func dj_setCornerRadius(size:CGSize, radius: CGFloat) -> UIImage {
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        
        let bezierPath = UIBezierPath(roundedRect: rect, cornerRadius: radius)
        bezierPath.addClip()

        draw(in: rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image ?? self
    }
    
    /// 拉伸图片
    ///
    /// - Parameters:
    ///   - leftOffset: 拉伸位置距图片最左边距离
    ///   - topOffest: 拉伸位置距图片最顶部距离
    /// - Returns: 拉伸后的图片
    func dj_resize(leftOffset: Int, topOffest: Int) -> UIImage {
        return stretchableImage(withLeftCapWidth: leftOffset, topCapHeight: topOffest)
    }
}
