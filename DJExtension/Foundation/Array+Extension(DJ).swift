//
//  DJGlobalMethods.swift
//  DJExtension
//
//  Created by David Jia on 16/8/2017.
//  Copyright © 2017 David Jia. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    /// 移除数组中的元素
    mutating func removeElement(_ element: Element) {
        
        guard let index = firstIndex(of: element) else {
            print("Array: remove element failed!")
            return
        }
        remove(at: index)
    }
}
