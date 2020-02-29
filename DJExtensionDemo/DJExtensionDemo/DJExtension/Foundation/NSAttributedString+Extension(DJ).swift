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
    public class func dj_init(string: String, fontSize: CGFloat, color: UIColor) -> NSAttributedString {
    
        let attrString = NSAttributedString(string: string, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize), NSAttributedString.Key.foregroundColor: color])
        
        return attrString
    }
}
