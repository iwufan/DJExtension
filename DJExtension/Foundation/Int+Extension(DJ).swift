//
//  Int+Extension.swift
//  DJExtension
//
//  Created by david on 2018/11/29.
//  Copyright © 2018 David Jia. All rights reserved.
//

import Foundation

extension Int {
    
    /// get digit of a number
    /// for example: 123.getDigit(), you'll get 3.
    /// - Returns: digit
    public func dj_digit() -> Int {
        
        var num = self
        var digit: Int = 1
        
        while num / 10 > 0 {
            digit = digit + 1
            num = num / 10
        }
        
        return digit
    }
}
