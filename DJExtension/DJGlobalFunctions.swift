//
//  DJGlobalMethods.swift
//  DJExtension
//
//  Created by David Jia on 16/8/2017.
//  Copyright © 2017 David Jia. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

let djScreenStandardWidth = 375     // standard width as iPhone 6.

// MARK: - Color
//
/// get color with hex value
///
/// - Parameters:
///   - hex: 16 system
///   - alpha: alpha
/// - Returns: UIColor
public func dj_hexColor(_ hex: String, alpha: CGFloat = 1.0) ->UIColor{
    
    return UIColor.dj_hex(hex, alpha: alpha)
}

/// get gray color
public func dj_rgbGrayColor(_ value: CGFloat, alpha: CGFloat = 1.0) ->UIColor{
    
    return UIColor(red: value / 255.0, green: value / 255.0, blue: value / 255.0, alpha: alpha)
}

/// get rgb color
public func dj_rgbColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) ->UIColor{
    
    return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
}

// MARK: - Adapt
/// get adapter value
///
/// - Parameter value: standard value
/// - Returns: adapter value
public func dj_adapterValue(_ value: CGFloat) -> CGFloat {
    
    return value * djScreenWidth / CGFloat(djScreenStandardWidth)
}

// MARK: - NSNumber
/// create a number object
///
/// - Parameter rawValue: int
/// - Returns: number
public func dj_number(_ rawValue: Int) -> NSNumber {
    
    return NSNumber(value: rawValue)
}

// MARK: - Font

/// setup font
public func dj_systemfont(_ fontSize: CGFloat) -> UIFont {
    
    return UIFont.systemFont(ofSize: fontSize)
}
/// setup bold font
public func dj_boldSystemFont(_ fontSize: CGFloat) -> UIFont {
    
    return UIFont.boldSystemFont(ofSize: fontSize)
}
/// setup pingfangsc-regular font
public func dj_pingRegularFont(_ fontSize: CGFloat) -> UIFont {
    
    return UIFont(name: "PingFangSC-Regular", size: fontSize)!
}
/// setup pingfangsc-medium font
public func dj_pingMediumFont(_ fontSize: CGFloat) -> UIFont {
    
    return UIFont(name: "PingFangSC-Medium", size: fontSize)!
}
/// setup pingfangsc-semibold font
public func dj_pingSemiboldFont(_ fontSize: CGFloat) -> UIFont {
    
    return UIFont(name: "PingFangSC-Semibold", size: fontSize)!
}

// MARK: - Image
public func dj_image(_ imageName: String) -> UIImage {
    
    guard let image = UIImage(named: imageName) else {
        return UIImage()
    }
    
    return image
}

// MARK: - Camera/PhotoLibrary
// camera authorization
public func dj_isCameraAllowed() -> Bool {
    
    let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
    return authStatus != .restricted && authStatus != .denied
}
// photo library authorization
public func dj_isPhotoLibraryAllowed() -> Bool {
    let authStatus = PHPhotoLibrary.authorizationStatus()
    return authStatus != .restricted && authStatus != .denied
}

// MARK: - Userdefaults
/// get value from userdefaults
///
/// - Parameter key: key
/// - Returns: value
public func dj_userdefaults(_ key: String) -> String? {
    
    return UserDefaults.standard.value(forKey: key) as? String
}

// MARK: - height of navigation bar
public func dj_navigationBarHeight() -> CGFloat {
    
    let statusHeight = UIApplication.shared.statusBarFrame.height
    return statusHeight + 44
}

// MARK: - Judge
/// judge whether a string is empty
///
/// - Parameter object: string
/// - Returns: true = empty, false = not empty
public func dj_isEmpty(_ obj: AnyObject?) -> Bool {
    
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
public func dj_isEmptyString(_ obj: AnyObject?) -> Bool {
    
    if obj == nil || (obj?.isKind(of: NSNull.self))! {
        return true
    }
    
    let str = (obj as! String).trimmingCharacters(in: .whitespaces)
    
    return (str.count == 0) ? true : false;
}

/// whether a iPhoneX, XS, XS Max or not
///
/// - Returns: true = 是
public func dj_isIPhoneX() -> Bool {
    
    return djScreenHeight >= 812
}

// MARK: - Date
/// get date string from Date object
///
/// - Parameters:
///   - date: a Date object
///   - format: format
/// - Returns: date string
public func dj_getFormattedDate(date: Date, format: String = "yyyy-MM-dd") -> String {
    
    let formatter = DateFormatter()
    formatter.dateFormat = format
    
    return formatter.string(from: date)
}

/// get date string from a timestamp
///
/// - Parameter timeStamp: timestamp
/// - Returns: date string
public func dj_getDateFromTimeStamp(timeStamp: Int, format: String = "yyyy-MM-dd") -> String? {
    
    let date = Date(timeIntervalSince1970: TimeInterval(timeStamp / 1000))
    
    return dj_getFormattedDate(date: date, format: format)
}

/// get a timestamp from a date string
///
/// - Parameters:
///   - dateStr: date string
///   - format: format
/// - Returns: timestamp
public func dj_getTimeStampFromDateString(dateStr: String, format: String) -> Double? {
    
    let formatter = DateFormatter()
    formatter.dateFormat = format
    let date = formatter.date(from: dateStr)
    
    if date == nil {
        return 0
    }
    
    let timestamp = date?.timeIntervalSince1970
    
    return timestamp
}

// MARK: - json
/// 转换的json带\n
public func dj_toJson(_ object:Any) -> String? {
    
    do {
        let data = try JSONSerialization.data(withJSONObject: object, options: JSONSerialization.WritingOptions.prettyPrinted)
        return String(data: data, encoding: String.Encoding.utf8)
    } catch {
        print(error)
        return nil
    }
}
/// 转换的json不带\n
public func dj_toPureJson(_ object:Any) -> String? {
    
    do {
        let data = try JSONSerialization.data(withJSONObject: object, options: JSONSerialization.WritingOptions.prettyPrinted)
        let jsonString = String(data: data, encoding: String.Encoding.utf8)
        let string = jsonString?.replacingOccurrences(of: "\n", with: "")
        return string
    } catch {
        print(error)
        return nil
    }
}
/// json转字典数组
public func dj_jsonToDictArray(_ json:String) -> [[String: Any]]? {
    
    let jsonData = json.data(using: .utf8)!
    
    do {
        let list = try JSONSerialization.jsonObject(with: jsonData,
                                                    options: .mutableContainers) as! [[String: Any]]
        return list
    } catch {
        print(error)
        return nil
    }
}

// MARK: - call
public func dj_callPhone(_ phoneNumber: String?) {
    
    guard let phoneNumber = phoneNumber, let url = URL(string: "tel://\(phoneNumber)") else {
        print("this phone number is not valid.")
        return
    }
    
    if #available(iOS 10.0, *) {
        dj_openURL(url: url) { (res) in
            print("call phone number \(phoneNumber) - \(res)")
        }
    } else {
        UIApplication.shared.openURL(url)
    }
}

// MARK: - open url
@available(iOS 10.0, *)
public func dj_openURL(url: URL?, completion:((Bool) -> Void)?) {
    
    guard let url = url else {
        print("the open url is nil")
        return
    }
    
    if UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url, options: [:], completionHandler: completion)
    }
}

// MARK: - keyboard
/// hide keyboard
public func dj_hideKeyboard() {
    
    UIApplication.shared.keyWindow?.endEditing(true)
}

// MARK: - Property value
// convert a value to int
public func dj_getInt(_ value: Any?) -> Int! {
    
    if (value as AnyObject).isKind(of: NSNull.self) || dj_isEmpty(value as AnyObject) {
        return nil
    } else {
        return value as? Int
    }
}
// convert a value to string
public func dj_getString(_ value: Any?) -> String! {
    
    if (value as AnyObject).isKind(of: NSNull.self) || (value as? String) == nil || dj_isEmpty(value as AnyObject) {
        return nil
    } else {
        return value as? String
    }
}

// MARK: - file
/// Read a file from a url then save it to disk
///
/// - Parameters:
///   - url: internet url
///   - fileName: file name
public func dj_saveFile(url: String, fileName: String) {
    
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
public func dj_deleteFile(fileName: String) {
    
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
public func dj_checkFileExist(fileName: String) -> Bool {
    
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
public func dj_getPathInSandBox(fileName: String) -> URL {
    
    let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
    let copyPath = (docPath! as NSString).appendingPathComponent(fileName)
    
    return URL(fileURLWithPath: copyPath)
}

// MARK: - Notification
/// Post a notification
public func dj_postNotification(name: String, obj: Any? = nil, userInfo: [AnyHashable : Any]? = nil) {
    
    NotificationCenter.default.post(name: NSNotification.Name(rawValue:name) , object: obj, userInfo: userInfo)
}
/// Observer a notification
public func dj_addObserver(observer: Any, selector: Selector, name: String, obj: Any? = nil) {
    
    NotificationCenter.default.addObserver(observer, selector: selector, name: NSNotification.Name(rawValue: name), object: obj)
}
