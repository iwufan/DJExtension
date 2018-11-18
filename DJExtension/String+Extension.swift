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
    func dj_attributedStringWithLineSpace(_ lineSpace: CGFloat) -> NSMutableAttributedString {
        
        let attrContent = NSMutableAttributedString(string: self)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace
        
        attrContent.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, self.count))
        
        return attrContent
    }
    /// convert a String to attributed string with parameters
    func dj_attributedString(rangeArray: Array<Dictionary<String, Any>>, fontArray: Array<UIFont>, colorArray: Array<UIColor>, lineSpacing: CGFloat = 0) -> NSMutableAttributedString {
    
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

    func dj_substringTo(_ offset: Int) -> String {
        
        return String(prefix(offset))
    }
    
    func dj_substringFrom(_ offset: Int) -> String {
        
        let indexFrom = index(startIndex, offsetBy: offset)
        return String(self[indexFrom...])
    }
}

extension String {

    /// calculate size with maxsize and font
    /// - Returns: size
    func dj_size(maxWidth: CGFloat, maxHeight: CGFloat, fontSize: CGFloat) -> CGSize {
    
        return self.boundingRect(with: CGSize(width: maxWidth, height: maxHeight), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: dj_font(fontSize)], context: nil).size
    }
}

extension String {
    
    /// remove all the space
    ///
    /// - Returns: 无空格的字符串
    func dj_clearSpace() -> String {
        
        return replacingOccurrences(of: " ", with: "")
    }
}

extension String {
    
    func dj_isInt() -> Bool {
        
        let scan = Scanner(string: self)
        var val:Int = 0
        
        return scan.scanInt(&val) && scan.isAtEnd
    }
}

extension String {
    
    /// convert a number to chinese string
    func dj_chineseNumber() -> String {
        
        if !self.dj_isInt() {
            return self
        }
        
        var chineseStr = ""

        switch Int(self)! {
            case 0:
                chineseStr = "零"
            case 1:
                chineseStr = "一"
            case 2:
                chineseStr = "二"
            case 3:
                chineseStr = "三"
            case 4:
                chineseStr = "四"
            case 5:
                chineseStr = "五"
            case 6:
                chineseStr = "六"
            case 7:
                chineseStr = "七"
            case 8:
                chineseStr = "八"
            case 9:
                chineseStr = "九"
            case 10:
                chineseStr = "十"
            default:
                chineseStr = self
        }
        
        return chineseStr
    }
}
