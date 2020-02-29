//
//  ViewController.swift
//  DJExtensionDemo
//
//  Created by David Jia on 29/2/2020.
//  Copyright © 2020 david. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIButton(title: "login", titleFont: dj_regularFont(22), titleColor: .red, bgColor: .lightGray, superView: view, layoutClosure: { (make) in
            make.left.equalTo(20)
            make.top.equalTo(77)
            make.width.height.equalTo(88)
        }) {
            print("登录成功")
        }
        
        UILabel(text: "hello", font: dj_regularFont(14), color: dj_hexColor("ff0000"), alignment: .center, superView: view) { (make) in
            make.center.equalTo(self.view)
            make.width.height.equalTo(80)
        }
        
        print(dj_statusBarHeight())
    }


}

