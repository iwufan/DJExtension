//
//  UITableView+Extension.swift
//  BambooLodge
//
//  Created by 贾大伟 on 2018/8/16.
//  Copyright © 2018 david. All rights reserved.
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
