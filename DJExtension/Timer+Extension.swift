//
//  DJGlobalMethods.swift
//  DJExtension
//
//  Created by David Jia on 16/8/2017.
//  Copyright © 2017 David Jia. All rights reserved.
//

import UIKit

extension Timer {
    
    // 暂停
    func dj_pause() {
        
        fireDate = Date.distantFuture
    }
    // 继续
    func dj_resume() {
        
        fireDate = Date()
    }
}
