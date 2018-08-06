//
//  DJGlobalMethods.swift
//  DJExtension
//
//  Created by David Jia on 16/8/2017.
//  Copyright © 2017 David Jia. All rights reserved.
//

import UIKit

extension NSAttributedString {

    /// quick way to create a attribute string
    class func dj_init(string: String, fontSize: CGFloat, color: UIColor) -> NSAttributedString {
    
        let attrString = NSAttributedString(string: string, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize), NSAttributedStringKey.foregroundColor: color])
        
        return attrString
    }
}
