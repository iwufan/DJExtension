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
    @discardableResult
    public convenience init(delegate: UITableViewDelegate, dataSource: UITableViewDataSource, rowHeight: CGFloat, showIndicator: Bool = false, separatorStyle: UITableViewCell.SeparatorStyle = .none, superView: UIView, closure: (ConstraintMaker) -> Void) {
        
        self.init()
        
        self.dataSource                 = dataSource
        self.delegate                   = delegate
        self.rowHeight                  = rowHeight
        self.separatorStyle             = separatorStyle
        showsVerticalScrollIndicator    = showIndicator
        showsHorizontalScrollIndicator  = showIndicator
        
        superView.addSubview(self)
        
        self.snp.makeConstraints(closure)
    }
}
