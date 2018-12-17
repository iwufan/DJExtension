//
//  DJGlobalMethods.swift
//  DJExtension
//
//  Created by David Jia on 16/8/2017.
//  Copyright © 2017 David Jia. All rights reserved.
//

import UIKit
import SnapKit

/// init method
extension UITextField {

    /// quick way to create a textfield with super view
    @discardableResult
    public convenience init (placeholder: String, placeholderColor: UIColor, placeholderFont: UIFont, textColor: UIColor, font: UIFont? = nil, alignment: NSTextAlignment = .left, keyboardType: UIKeyboardType = .default, clearButtonMode: UITextField.ViewMode = .whileEditing, superView: UIView, closure: (ConstraintMaker) -> Void) {
        
        self.init()
        
        let rangeDict           = [djRangeLocation: "0", djRangeLength: "\(placeholder.count)"] as [String : Any]
        
        let attrPlaceholder     = placeholder.dj_attributedString(rangeArray: [rangeDict], fontArray: [placeholderFont], colorArray: [placeholderColor])
        attributedPlaceholder   = attrPlaceholder
        self.textColor          = textColor
        self.font               = font == nil ? placeholderFont : font
        self.textAlignment      = alignment
        self.tintColor          = placeholderColor
        self.keyboardType       = keyboardType
        self.clearButtonMode    = clearButtonMode
        
        superView.addSubview(self)
        
        self.snp.makeConstraints(closure)
    }
    
    /// quick way to create a textfield with leftImageView and super view
    public convenience init(placeholder: String, placeholderColor: UIColor, placeholderFont: UIFont, textColor: UIColor, font: UIFont? = nil, alignment: NSTextAlignment = .left, keyboardType: UIKeyboardType = .default, clearButtonMode: UITextField.ViewMode = .whileEditing, leftImage: String, imageSize: CGSize, superView: UIView, closure: (ConstraintMaker) -> Void) {
        
        self.init()
        
        let rangeDict           = [djRangeLocation: "0", djRangeLength: "\(placeholder.count)"] as [String : Any]
        
        let attrPlaceholder     = placeholder.dj_attributedString(rangeArray: [rangeDict], fontArray: [placeholderFont], colorArray: [placeholderColor])
        attributedPlaceholder   = attrPlaceholder
        self.textColor          = textColor
        self.font               = font == nil ? placeholderFont : font
        self.textAlignment      = alignment
        self.tintColor          = placeholderColor
        self.keyboardType       = keyboardType
        self.clearButtonMode    = clearButtonMode
        
        let imageView = UIImageView(image: UIImage(named: leftImage))
        imageView.frame = CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height)
        imageView.contentMode = .center
        self.leftView = imageView
        self.leftViewMode = .always
        
        superView.addSubview(self)
        
        self.snp.makeConstraints(closure)
    }

}
