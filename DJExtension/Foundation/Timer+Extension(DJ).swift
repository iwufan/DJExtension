//
//  DJGlobalMethods.swift
//  DJExtension
//
//  Created by David Jia on 16/8/2017.
//  Copyright © 2017 David Jia. All rights reserved.
//

import UIKit

extension Timer {
    
    // pause
    public func dj_pause() {
        
        fireDate = Date.distantFuture
    }
    // resume
    public func dj_resume() {
        
        fireDate = Date()
    }
}
