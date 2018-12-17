//
//  UITableView+Extension.swift
//  DJExtension
//
//  Created by David Jia on 2018/8/16.
//  Copyright © 2018 David Jia. All rights reserved.
//

import UIKit
import SnapKit

extension UITableView {
    
    /// quick way to create a tableView with super view
    public convenience init(delegate: UITableViewDelegate, dataSource: UITableViewDataSource, showIndicator: Bool = false, separatorStyle: UITableViewCell.SeparatorStyle = .none, superView: UIView, closure: (ConstraintMaker) -> Void) {
        
        self.init()
        
        self.dataSource                 = dataSource
        self.delegate                   = delegate
        self.separatorStyle             = separatorStyle
        showsVerticalScrollIndicator    = showIndicator
        showsHorizontalScrollIndicator  = showIndicator
        
        superView.addSubview(self)
        
        self.snp.makeConstraints(closure)
    }
}
