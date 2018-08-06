//
//  DJGlobalMethods.swift
//  DJExtension
//
//  Created by David Jia on 16/8/2017.
//  Copyright © 2017 David Jia. All rights reserved.
//

import UIKit

/// 通用工具类
struct DJTool {
    
    /// judge whether a string is empty
    ///
    /// - Parameter object: string
    /// - Returns: true = empty, false = not empty
    static func isEmpty(_ obj: AnyObject?) -> Bool {
        
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
    static func isEmptyString(_ obj: AnyObject?) -> Bool {
        
        if obj == nil || (obj?.isKind(of: NSNull.self))! {
            return true
        }
        
        let str = (obj as! String).trimmingCharacters(in: .whitespaces)
        
        return (str.count == 0) ? true : false;
    }
}

extension DJTool {
    
    /// 快速获得日期字符串
    ///
    /// - Parameters:
    ///   - date: 日期对象
    ///   - format: 格式
    /// - Returns: 日期字符串
    static func getFormattedDate(date: Date, format: String = "yyyy/MM/dd") -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
    
    /// 转换时间戳为日期
    ///
    /// - Parameter timeStamp: 时间戳
    /// - Returns: 日期（yyyy/MM/dd）
    static func getDateFromTimeStamp(timeStamp: Int, format: String = "yyyy/MM/dd") -> String? {
        
        let date = Date(timeIntervalSince1970: TimeInterval(timeStamp / 1000))
        
        return getFormattedDate(date: date, format: format)
    }
    
    /// 转换日期字符串为时间戳
    ///
    /// - Parameters:
    ///   - dateStr: 日期字符串
    ///   - format: 日期格式
    /// - Returns: 时间戳
    static func getTimeStampFromDate(dateStr: String, format: String) -> Double? {
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let date = formatter.date(from: dateStr)
        
        if date == nil {
            return 0
        }
        
        let timestamp = date?.timeIntervalSince1970
        
        return timestamp
    }
}

extension DJTool {
    
    /// get time string with format "00:00"
    ///
    /// - Parameter seconds: total seconds
    /// - Returns: "00:00"
    static func getFormattedTime(seconds: NSInteger) -> String {
        
        let minute = seconds / 60;
        let second = seconds % 60;
        
        let minStr = String(format: "%02ld", minute)
        let secondStr = String(format: "%02ld", second)
        
        return "\(minStr)" + ":" + "\(secondStr)"
    }
}

extension DJTool {
    
    // 获得Int属性值
    static func getInt(_ value: Any?) -> Int! {
        
        if (value as AnyObject).isKind(of: NSNull.self) || DJTool.isEmpty(value as AnyObject) {
            return nil
        } else {
            return value as? Int
        }
    }
    // 获得String属性值
    static func getString(_ value: Any?) -> String! {
        
        if (value as AnyObject).isKind(of: NSNull.self) || (value as? String) == nil || DJTool.isEmpty(value as AnyObject) {
            return nil
        } else {
            return value as? String
        }
    }
}

extension DJTool {
    
    /// 归档对象
    ///
    /// - Parameters:
    ///   - name: 文件名
    ///   - obj: 对象本身
    static func archiveFile(name: String, obj: Any?) {
    
        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
        let path = (docPath! as NSString).appendingPathComponent(name)
        
        NSKeyedArchiver.archiveRootObject(obj!, toFile: path)
    }
    
    /// 解档对象
    ///
    /// - Parameter name: 文件名
    /// - Returns: 解档后的对象
    static func unarchiveFile(name: String) -> Any? {
    
        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
        let path = (docPath! as NSString).appendingPathComponent(name)
        
        return NSKeyedUnarchiver.unarchiveObject(withFile: path)
    }
    
    /// 从url读取内容并存储成文件
    ///
    /// - Parameters:
    ///   - url: 路径
    ///   - fileName: 保存的文件名
    static func saveFile(url: String, fileName: String) {
        
        if DJTool.isEmptyString(url as AnyObject) {
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
    static func deleteFile(fileName: String) {
        
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
    static func checkFileExist(fileName: String) -> Bool {
        
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
    static func getPathInSandBox(fileName: String) -> URL {
        
        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
        let copyPath = (docPath! as NSString).appendingPathComponent(fileName)
        
        return URL(fileURLWithPath: copyPath)
    }
}
