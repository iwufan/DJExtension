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
    
    public convenience init(image: UIImage?, superView: UIView, closure: (ConstraintMaker) -> Void) {
        
        self.init()
        
        self.image = image
        
        superView.addSubview(self)
        
        self.snp.makeConstraints(closure)
    }
}
