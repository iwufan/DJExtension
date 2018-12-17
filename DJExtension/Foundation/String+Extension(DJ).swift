//
//  DJGlobalMethods.swift
//  DJExtension
//
//  Created by David Jia on 16/8/2017.
//  Copyright © 2017 David Jia. All rights reserved.
//

import UIKit

// MARK - attribute string
extension String {
    
    /// Add line space for String
    ///
    /// - Parameter lineSpace:
    /// - Returns: string with line space
    public func dj_attributedStringWithLineSpace(_ lineSpace: CGFloat) -> NSMutableAttributedString {
        
        let attrContent = NSMutableAttributedString(string: self)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace
        
        attrContent.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, self.count))
        
        return attrContent
    }
    /// convert a String to attributed string with parameters
    public func dj_attributedString(rangeArray: Array<Dictionary<String, Any>>, fontArray: Array<UIFont>, colorArray: Array<UIColor>, lineSpacing: CGFloat = 0) -> NSMutableAttributedString {
    
        // if rangeArray is empty, return self
        if rangeArray.count == 0 {
            return NSMutableAttributedString(string: self)
        }
        // if every arrays' count are not consistent, return self
        if (rangeArray.count != fontArray.count) || (rangeArray.count != colorArray.count) {
            return NSMutableAttributedString(string: self)
        }
        // define a Attributed String
        let attrContent = NSMutableAttributedString(string: self)
        
        for index in 0..<rangeArray.count {
            // get range
            let dict = rangeArray[index];
            let location:String = dict[djRangeLocation] as! String;
            let length:String = dict[djRangeLength] as! String;
            // range
            let range = NSMakeRange(Int(location)!, Int(length)!);
            // set font
            attrContent.addAttribute(NSAttributedString.Key.font, value: fontArray[index], range: range)
            // set textcolor
            attrContent.addAttribute(NSAttributedString.Key.foregroundColor, value: colorArray[index], range: range)
        }
        
        // set line space
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing;
        
        attrContent.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, self.count))
        
        return attrContent;
    }
}
// MARK: - Clip String
extension String {

    public func dj_substringTo(_ offset: Int) -> String {
        
        return String(prefix(offset))
    }
    
    public func dj_substringFrom(_ offset: Int) -> String {
        
        let indexFrom = index(startIndex, offsetBy: offset)
        return String(self[indexFrom...])
    }
}

extension String {

    /// calculate size with maxsize and font
    /// - Returns: size
    public func dj_size(maxWidth: CGFloat, maxHeight: CGFloat, font: UIFont) -> CGSize {
    
        return self.boundingRect(with: CGSize(width: maxWidth, height: maxHeight), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil).size
    }
}

extension String {
    
    /// remove all the space
    ///
    /// - Returns: a string without space
    public func dj_clearSpace() -> String {
        
        return replacingOccurrences(of: " ", with: "")
    }
    /// remove the last symbol
    public func dj_removeLastSymbol() -> String {
        
        if self.count > 1 {
            return dj_substringTo(self.count - 1)
        } else {
            return self
        }
    }
}

extension String {
    
    public func dj_isInt() -> Bool {
        
        let scan = Scanner(string: self)
        var val:Int = 0
        
        return scan.scanInt(&val) && scan.isAtEnd
    }
    /// it'll return false if the text are emojis or other special characters.
    public func dj_isInputValid() -> Bool {
        
        let pattern = "^[a-zA-Z0-9\\u4E00-\\u9FA5]*$"
        let pred  = NSPredicate(format: "SELF MATCHES %@", pattern)
        
        let isMatch = pred.evaluate(with: self)
        
        if isMatch || self == "" || "➋➌➍➎➏➐➑➒".contains(self) {
            return true
        }
        
        return false
    }
    /// it'll return false if the text are emojis.
    public func dj_isInputValidWithSymbols() -> Bool {
        
        let pattern = "^[a-zA-Z0-9\\u4E00-\\u9FA5\\.\\,\\?\\!\\。\\，\\、\\！\\？\\：\\“\\”\\（\\）\\……\\*\\·\\~\\@\\#\\￥\\%\\&\\-\\[\\]\\《\\》\\‘\\’\\|\\ \\{\\}\\$\\^\\(\\)\\<\\>\\;\\:\\+\\_\\=\\`\\'\\\"\\/\\——\\【\\】]*$"
        let pred  = NSPredicate(format: "SELF MATCHES %@", pattern)
        
        let isMatch = pred.evaluate(with: self)
        
        if isMatch || self == "" || "➋➌➍➎➏➐➑➒".contains(self) {
            return true
        }
        
        return false
    }
}
