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
func dj_hexColor(_ hex: String, alpha: CGFloat = 1.0) ->UIColor{
    
    return UIColor.dj_hex(hex, alpha: alpha)
}

/// get gray color
func dj_rgbColor(_ value: CGFloat, alpha: CGFloat = 1.0) ->UIColor{
    
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
func dj_screenType() -> DJScreenType{

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
func dj_adapterValue(_ value: CGFloat) -> CGFloat {

    return value * djScreenWidth / CGFloat(djScreenStandardWidth)
}

/// create a number object
///
/// - Parameter rawValue: int
/// - Returns: number
func dj_number(_ rawValue: Int) -> NSNumber {

    return NSNumber.init(value: rawValue)
}

// MARK: - Font

/// setup font
func dj_font(_ fontSize: CGFloat) -> UIFont {

    return UIFont.systemFont(ofSize: fontSize)
}
/// setup bold font
func dj_boldFont(_ fontSize: CGFloat) -> UIFont {
    
    return UIFont.boldSystemFont(ofSize: fontSize)
}

/// 获取偏好设置的值
///
/// - Parameter key: 存储的键
/// - Returns: 值
func dj_userdefaults(_ key: String) -> String? {

    return UserDefaults.standard.value(forKey: key) as? String
}

/// judge whether a string is empty
///
/// - Parameter object: string
/// - Returns: true = empty, false = not empty
func dj_isEmpty(_ obj: AnyObject?) -> Bool {
    
    if obj == nil || (obj?.isKind(of: NSNull.self))! {
        return true
    } else {
        return false
    }
}
/// judge whether a string is empty
///
/// - Parameter object: string
/// - Returns: true = empty, false = not empty
func dj_isEmptyString(_ obj: AnyObject?) -> Bool {
    
    if obj == nil || (obj?.isKind(of: NSNull.self))! {
        return true
    }
    
    let str = (obj as! String).trimmingCharacters(in: .whitespaces)
    
    return (str.count == 0) ? true : false;
}

/// 快速获得日期字符串
///
/// - Parameters:
///   - date: 日期对象
///   - format: 格式
/// - Returns: 日期字符串
func dj_getFormattedDate(date: Date, format: String = "yyyy/MM/dd") -> String {
    
    let formatter = DateFormatter()
    formatter.dateFormat = format
    
    return formatter.string(from: date)
}

/// 转换时间戳为日期
///
/// - Parameter timeStamp: 时间戳
/// - Returns: 日期（yyyy/MM/dd）
func dj_getDateFromTimeStamp(timeStamp: Int, format: String = "yyyy/MM/dd") -> String? {
    
    let date = Date(timeIntervalSince1970: TimeInterval(timeStamp / 1000))
    
    return dj_getFormattedDate(date: date, format: format)
}

/// 转换日期字符串为时间戳
///
/// - Parameters:
///   - dateStr: 日期字符串
///   - format: 日期格式
/// - Returns: 时间戳
func dj_getTimeStampFromDate(dateStr: String, format: String) -> Double? {
    
    let formatter = DateFormatter()
    formatter.dateFormat = format
    let date = formatter.date(from: dateStr)
    
    if date == nil {
        return 0
    }
    
    let timestamp = date?.timeIntervalSince1970
    
    return timestamp
}

// 获得Int属性值
func dj_getInt(_ value: Any?) -> Int! {
    
    if (value as AnyObject).isKind(of: NSNull.self) || dj_isEmpty(value as AnyObject) {
        return nil
    } else {
        return value as? Int
    }
}
// 获得String属性值
func dj_getString(_ value: Any?) -> String! {
    
    if (value as AnyObject).isKind(of: NSNull.self) || (value as? String) == nil || dj_isEmpty(value as AnyObject) {
        return nil
    } else {
        return value as? String
    }
}

/// 归档对象
///
/// - Parameters:
///   - name: 文件名
///   - obj: 对象本身
func dj_archiveFile(name: String, obj: Any?) {
    
    let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
    let path = (docPath! as NSString).appendingPathComponent(name)
    
    NSKeyedArchiver.archiveRootObject(obj!, toFile: path)
}

/// 解档对象
///
/// - Parameter name: 文件名
/// - Returns: 解档后的对象
func dj_unarchiveFile(name: String) -> Any? {
    
    let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
    let path = (docPath! as NSString).appendingPathComponent(name)
    
    return NSKeyedUnarchiver.unarchiveObject(withFile: path)
}

/// 从url读取内容并存储成文件
///
/// - Parameters:
///   - url: 路径
///   - fileName: 保存的文件名
func dj_saveFile(url: String, fileName: String) {
    
    if dj_isEmptyString(url as AnyObject) {
        return
    }
    
    let url = URL(string: url)
    
    if let data = try? Data(contentsOf: url!) {
        
        let docpath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
        let filePath = (docpath! as NSString).appendingPathComponent(fileName)
        
        (data as NSData).write(toFile: filePath, atomically: true)
    }
}

/// 删除文件
///
/// - Parameters:
///   - fileName: 文件名
/// - Returns: 是否删除成功
func dj_deleteFile(fileName: String) {
    
    let fileManager = FileManager()
    
    let docpath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
    let filePath = (docpath! as NSString).appendingPathComponent(fileName)
    
    let isFile = UnsafeMutablePointer<ObjCBool>.allocate(capacity: 1)
    isFile[0] = false
    
    if fileManager.fileExists(atPath: filePath, isDirectory: isFile) {
        do {
            try fileManager.removeItem(atPath: filePath)
            
        } catch {
            print("文件删除失败")
        }
    }
}
/// 检查文件是否存在
///
/// - Parameters:
///   - fileName: 文件名
/// - Returns: 是否删除成功
func dj_checkFileExist(fileName: String) -> Bool {
    
    let fileManager = FileManager()
    
    let docpath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
    let filePath = (docpath! as NSString).appendingPathComponent(fileName)
    
    let isFile = UnsafeMutablePointer<ObjCBool>.allocate(capacity: 1)
    isFile[0] = false
    
    if fileManager.fileExists(atPath: filePath, isDirectory: isFile) {
        return true
    } else {
        return false
    }
}
/// 获取沙盒文件路径
func dj_getPathInSandBox(fileName: String) -> URL {
    
    let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
    let copyPath = (docPath! as NSString).appendingPathComponent(fileName)
    
    return URL(fileURLWithPath: copyPath)
}

/// 通知
/// 发通知
func dj_postNotification(name: String, obj: Any? = nil, userInfo: [AnyHashable : Any]? = nil) {

    NotificationCenter.default.post(name: NSNotification.Name(rawValue:name) , object: obj, userInfo: userInfo)
}
/// 监听通知
func dj_addObserver(observer: Any, selector: Selector, name: String, obj: Any? = nil) {

    NotificationCenter.default.addObserver(observer, selector: selector, name: NSNotification.Name(rawValue: name), object: obj)
}
