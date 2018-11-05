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

// MARK: - Color
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
func dj_rgbGrayColor(_ value: CGFloat, alpha: CGFloat = 1.0) ->UIColor{
    
    return UIColor(red: value / 255.0, green: value / 255.0, blue: value / 255.0, alpha: alpha)
}

/// get rgb color
func dj_rgbColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) ->UIColor{
    
    return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
}

// MARK: - Screen

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

// MARK: - Adapt
/// get adapter value
///
/// - Parameter value: standard value
/// - Returns: adapter value
func dj_adapterValue(_ value: CGFloat) -> CGFloat {
    
    return value * djScreenWidth / CGFloat(djScreenStandardWidth)
}

// MARK: - NSNumber
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

// MARK: - Userdefaults
/// get value from userdefaults
///
/// - Parameter key: key
/// - Returns: value
func dj_userdefaults(_ key: String) -> String? {
    
    return UserDefaults.standard.value(forKey: key) as? String
}

// MARK: - height of navigation bar
func dj_navigationBarHeight() -> CGFloat {
    
    let statusHeight = UIApplication.shared.statusBarFrame.height
    return statusHeight + 44
}

// MARK: - Judge
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

/// whether a iPhoneX, XS, XS Max or not
///
/// - Returns: true = 是
func dj_isIPhoneX() -> Bool {
    
    return djScreenHeight == 812
}

// MARK: - Date
/// get date string from Date object
///
/// - Parameters:
///   - date: a Date object
///   - format: format
/// - Returns: date string
func dj_getFormattedDate(date: Date, format: String = "yyyy/MM/dd") -> String {
    
    let formatter = DateFormatter()
    formatter.dateFormat = format
    
    return formatter.string(from: date)
}

/// get date string from a timestamp
///
/// - Parameter timeStamp: timestamp
/// - Returns: date string
func dj_getDateFromTimeStamp(timeStamp: Int, format: String = "yyyy/MM/dd") -> String? {
    
    let date = Date(timeIntervalSince1970: TimeInterval(timeStamp / 1000))
    
    return dj_getFormattedDate(date: date, format: format)
}

/// get a timestamp from a date string
///
/// - Parameters:
///   - dateStr: date string
///   - format: format
/// - Returns: timestamp
func dj_getTimeStampFromDateString(dateStr: String, format: String) -> Double? {
    
    let formatter = DateFormatter()
    formatter.dateFormat = format
    let date = formatter.date(from: dateStr)
    
    if date == nil {
        return 0
    }
    
    let timestamp = date?.timeIntervalSince1970
    
    return timestamp
}

// MARK: - Property value
// convert a value to int
func dj_getInt(_ value: Any?) -> Int! {
    
    if (value as AnyObject).isKind(of: NSNull.self) || dj_isEmpty(value as AnyObject) {
        return nil
    } else {
        return value as? Int
    }
}
// convert a value to string
func dj_getString(_ value: Any?) -> String! {
    
    if (value as AnyObject).isKind(of: NSNull.self) || (value as? String) == nil || dj_isEmpty(value as AnyObject) {
        return nil
    } else {
        return value as? String
    }
}

/// archive a object
///
/// - Parameters:
///   - name: archive name
///   - obj: the object to be archived
func dj_archiveFile(name: String, obj: Any) {
    
    let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
    let path = (docPath! as NSString).appendingPathComponent(name)
    
    if #available(iOS 12.0, *) {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: obj, requiringSecureCoding: true)
            try data.write(to: URL(fileURLWithPath: path))
        } catch {
            print("archive - failed")
        }
    } else {
        NSKeyedArchiver.archiveRootObject(obj, toFile: path)
    }
}

/// unarchive a object
///
/// - Parameter name: file name
/// - Returns: an object
func dj_unarchiveFile(name: String) -> Any? {
    
    let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
    let path = (docPath! as NSString).appendingPathComponent(name)
    
    if #available(iOS 12.0, *) {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let obj = try NSKeyedUnarchiver.unarchivedObject(ofClasses: [AnyObject.self], from: data)
            
            return obj
        } catch {
            print("unarchive - failed")
            return nil
        }
    } else {
        return NSKeyedUnarchiver.unarchiveObject(withFile: path)
    }
}

// MARK: - file
/// Read a file from a url then save it to disk
///
/// - Parameters:
///   - url: internet url
///   - fileName: file name
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

/// delete file
///
/// - Parameters:
///   - fileName: file name
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
            print("file delete failed")
        }
    }
}
/// Check file exist or not
///
/// - Parameters:
///   - fileName: file name
/// - Returns: true = exist
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
/// get file path in sandbox
func dj_getPathInSandBox(fileName: String) -> URL {
    
    let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
    let copyPath = (docPath! as NSString).appendingPathComponent(fileName)
    
    return URL(fileURLWithPath: copyPath)
}

// MARK: - Notification
/// Post a notification
func dj_postNotification(name: String, obj: Any? = nil, userInfo: [AnyHashable : Any]? = nil) {
    
    NotificationCenter.default.post(name: NSNotification.Name(rawValue:name) , object: obj, userInfo: userInfo)
}
/// Observer a notification
func dj_addObserver(observer: Any, selector: Selector, name: String, obj: Any? = nil) {
    
    NotificationCenter.default.addObserver(observer, selector: selector, name: NSNotification.Name(rawValue: name), object: obj)
}
