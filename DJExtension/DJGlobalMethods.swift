//
//  DJGlobalMethods.swift
//  DJExtension
//
//  Created by David Jia on 16/8/2017.
//  Copyright © 2017 David Jia. All rights reserved.
//

import Foundation
import UIKit

let djScreenStandardWidth = 375     // standard width as iPhone 6.

// MARK: - color
//
/// get color with hex value
///
/// - Parameters:
///   - hex: 16 system
///   - alpha: alpha
/// - Returns: UIColor
func djHexColor(_ hex: String, alpha: CGFloat = 1.0) ->UIColor{
    
    return UIColor.hex(hex, alpha: alpha)
}

/// get gray color
func djRgbColor(_ value: CGFloat, alpha: CGFloat = 1.0) ->UIColor{
    
    return UIColor(red: value / 255.0, green: value / 255.0, blue: value / 255.0, alpha: alpha)
}

// MARK: - adapter

/// screen type
///
/// - small: type of 4, 4s, 5, 5s, 5c, se, iPod
/// - normal: type of 6, 6s, 7
/// - plus: type of 6p, 6sp, 7p
public enum DJScreenType : Int {
    
    case small
    case normal
    case plus
}

/// get screen type
///
/// - Returns: screen type
func djScreenType() -> DJScreenType{

    let screenWidth = UIScreen.main.bounds.width
    
    if screenWidth < 330 {
        return .small
    } else if screenWidth > 380 {
        return .plus
    } else {
        return .normal
    }
}

/// get adapter value
///
/// - Parameter value: standard value
/// - Returns: adapter value
func djAdapterValue(_ value: CGFloat) -> CGFloat {

    return value * djScreenWidth / CGFloat(djScreenStandardWidth)
}

/// create a number object
///
/// - Parameter rawValue: int
/// - Returns: number
func djNumber(_ rawValue: Int) -> NSNumber {

    return NSNumber.init(value: rawValue)
}

// MARK: - Font

/// setup font
func djFont(_ fontSize: CGFloat) -> UIFont {

    return UIFont.systemFont(ofSize: fontSize)
}
/// setup bold font
func djBoldFont(_ fontSize: CGFloat) -> UIFont {
    
    return UIFont.boldSystemFont(ofSize: fontSize)
}

/// 获取偏好设置的值
///
/// - Parameter key: 存储的键
/// - Returns: 值
func djUserdefaults(_ key: String) -> String? {

    return UserDefaults.standard.value(forKey: key) as? String
}

/// 通知
/// 发通知
func djPostNotification(name: String, obj: Any? = nil, userInfo: [AnyHashable : Any]? = nil) {

    NotificationCenter.default.post(name: NSNotification.Name(rawValue:name) , object: obj, userInfo: userInfo)
}
/// 监听通知
func djAddObserver(observer: Any, selector: Selector, name: String, obj: Any? = nil) {

    NotificationCenter.default.addObserver(observer, selector: selector, name: NSNotification.Name(rawValue: name), object: obj)
}
