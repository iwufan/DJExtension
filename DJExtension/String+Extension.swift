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
    
    /// 给普通字符串添加行间距
    ///
    /// - Parameter lineSpace: 间距值
    /// - Returns: 带行间距的字符串
    func dj_attributedStringWithLineSpace(_ lineSpace: CGFloat) -> NSMutableAttributedString {
        
        let attrContent = NSMutableAttributedString(string: self)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace
        
        attrContent.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, self.count))
        
        return attrContent
    }
    
    func dj_attributedString(rangeArray: Array<Dictionary<String, Any>>, fontArray: Array<UIFont>, colorArray: Array<UIColor>, lineSpacing: CGFloat = 0) -> NSMutableAttributedString {
    
        // 如果range数组为空，直接返回自己
        if rangeArray.count == 0 {
            return NSMutableAttributedString(string: self)
        }
        
        // 如果数组元素个数不一致，直接把返回自己
        if (rangeArray.count != fontArray.count) || (rangeArray.count != colorArray.count) {
            return NSMutableAttributedString(string: self)
        }
        
        // 带属性字符串
        let attrContent = NSMutableAttributedString(string: self)
        
        for index in 0..<rangeArray.count {
            
            // 获取range
            let dict = rangeArray[index];
            let location:String = dict["rangeLocation"] as! String;
            let length:String = dict["rangeLength"] as! String;
            
            // range
            let range = NSMakeRange(Int(location)!, Int(length)!);
            
            // 字体大小
            attrContent.addAttribute(NSAttributedStringKey.font, value: fontArray[index], range: range)
            
            // 字体颜色
            attrContent.addAttribute(NSAttributedStringKey.foregroundColor, value: colorArray[index], range: range)
        }
        
        // 内容行间距
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing;
        
        attrContent.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, self.count))
        
        return attrContent;
    }
}
// 截取
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
    
        return self.boundingRect(with: CGSize(width: maxWidth, height: maxHeight), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: dj_font(fontSize)], context: nil).size
    }
}

extension String {
    
    /// 去除字符串中所有的空格
    ///
    /// - Returns: 无空格的字符串
    func dj_clearSpace() -> String {
        
        return replacingOccurrences(of: " ", with: "")
    }
}

extension String {
    // 判断是否是整数
    func dj_isInt() -> Bool {
        
        let scan = Scanner(string: self)
        var val:Int = 0
        
        return scan.scanInt(&val) && scan.isAtEnd
    }
}

extension String {
    
    /// 将数字转化为汉字
    func dj_chineseString() -> String {
        // 不是整数直接返回自己
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
