//
//  UIImageView+Extension.swift
//  DJExtension
//
//  Created by david on 2018/12/11.
//  Copyright © 2018 David Jia. All rights reserved.
//

import UIKit
import SnapKit

extension UIImageView {
    
    @discardableResult
    public convenience init(image: UIImage?, superView: UIView? = nil, closure: ((ConstraintMaker) -> Void)? = nil) {
        
        self.init()
        
        self.image = image
        
        if let sView = superView {
            sView.addSubview(self)
            
            if let closure = closure {
                self.snp.makeConstraints(closure)
            }
        }
    }
}
