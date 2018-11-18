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

        return image.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
    }
    /// gradient image
    class func gradientImage(_ rect: CGRect, _ startPoint: CGPoint, _ endPoint: CGPoint, _ startColor: UIColor, _ endColor: UIColor) -> UIImage {
        
        let ciFilter = CIFilter(name: "CILinearGradient")
        
        let vector0 = CIVector(x: rect.size.width * startPoint.x, y: rect.size.height * (1 - startPoint.y))
        let vector1 = CIVector(x: rect.size.width * endPoint.x, y: rect.size.height * (1 - endPoint.y))

        ciFilter?.setValue(vector0, forKey: "inputPoint0")
        ciFilter?.setValue(vector1, forKey: "inputPoint1")

        ciFilter?.setValue(CIColor(cgColor: startColor.cgColor), forKey: "inputColor0")
        ciFilter?.setValue(CIColor(cgColor: endColor.cgColor), forKey: "inputColor1")

        let context = CIContext(options: nil)
        
        guard let ciImage = ciFilter?.outputImage else {
            return UIImage()
        }
        
        guard let resultCGImage = context.createCGImage(ciImage, from: rect) else {
            return UIImage()
        }
        
        let resultUIImage = UIImage(cgImage: resultCGImage)
        return resultUIImage

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
    
    /// Stretch a image
    func dj_resize(leftOffset: Int, topOffest: Int) -> UIImage {
        return stretchableImage(withLeftCapWidth: leftOffset, topCapHeight: topOffest)
    }
}
