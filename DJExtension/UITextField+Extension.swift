//
//  DJGlobalMethods.swift
//  DJExtension
//
//  Created by David Jia on 16/8/2017.
//  Copyright © 2017 David Jia. All rights reserved.
//

import UIKit

/// init method
extension UITextField {

    /// quick way to create a label
    convenience init (placeholder: String, placeholderColor: UIColor, placeholderFontSize: CGFloat, textColor: UIColor, textFontSize: CGFloat, keyboardType: UIKeyboardType = .default, clearButtonMode: UITextFieldViewMode = .whileEditing) {
        
        self.init()
        
        let rangeDict = ["rangeLocation": "0", "rangeLength": "\(placeholder.count)"] as [String : Any]
        
        let attrPlaceholder = placeholder.dj_attributedString(rangeArray: [rangeDict], fontArray: [dj_font(placeholderFontSize)], colorArray: [placeholderColor])
        attributedPlaceholder = attrPlaceholder
        self.textColor = textColor
        self.font = UIFont.systemFont(ofSize: textFontSize)
        self.tintColor = placeholderColor
        self.keyboardType = keyboardType
        self.clearButtonMode = clearButtonMode
    }
}
