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
    convenience init (placeholder: String, placeholderColor: UIColor, placeholderFont: UIFont, textColor: UIColor, font: UIFont, keyboardType: UIKeyboardType = .default, clearButtonMode: UITextField.ViewMode = .whileEditing) {
        
        self.init()
        
        let rangeDict = [djRangeLocation: "0", djRangeLength: "\(placeholder.count)"] as [String : Any]
        
        let attrPlaceholder = placeholder.dj_attributedString(rangeArray: [rangeDict], fontArray: [placeholderFont], colorArray: [placeholderColor])
        attributedPlaceholder = attrPlaceholder
        self.textColor = textColor
        self.font = font
        self.tintColor = placeholderColor
        self.keyboardType = keyboardType
        self.clearButtonMode = clearButtonMode
    }
}
