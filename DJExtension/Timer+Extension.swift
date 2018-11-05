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
    func dj_pause() {
        
        fireDate = Date.distantFuture
    }
    // resume
    func dj_resume() {
        
        fireDate = Date()
    }
}
