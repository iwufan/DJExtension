//
//  UITableView+Extension.swift
//  BambooLodge
//
//  Created by David Jia on 2018/8/16.
//  Copyright © 2018 David Jia. All rights reserved.
//

import UIKit

extension UITableView {
    
    convenience init(delegate: UITableViewDelegate, dataSource: UITableViewDataSource, showIndicator: Bool = false, separatorStyle: UITableViewCell.SeparatorStyle = .none) {
        
        self.init()
        
        self.dataSource                 = dataSource
        self.delegate                   = delegate
        self.separatorStyle             = separatorStyle
        showsVerticalScrollIndicator    = showIndicator
        showsHorizontalScrollIndicator  = showIndicator
    }
}
