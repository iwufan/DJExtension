//
//  UIAlertAction+Extension.swift
//  DJExtension
//
//  Created by david on 2018/12/14.
//  Copyright © 2018 David Jia. All rights reserved.
//

import UIKit

extension UIAlertAction {
    // set color for the title
    public func titleColor(_ color: UIColor) {
        setValue(color, forKey: "titleTextColor")
    }
}
