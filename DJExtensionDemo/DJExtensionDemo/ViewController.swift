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
        
        // labels
        createNormalLabel()
        createLabelWithLines()
        // buttons
        createButtonWithTitle()
    }
}

// MARK: - UILabel examples
extension UIViewController {
    
    fileprivate func createNormalLabel() {
        
        UILabel(text: "NormalLabel", font: dj_mediumFont(18), color: .orange, superView: view) { (make) in
            make.left.equalTo(50)
            make.top.equalTo(200)
            make.width.equalTo(150)
            make.height.equalTo(20)
        }
    }
    
    fileprivate func createLabelWithLines() {
        
        UILabel(text: "hi, nice to meet you.", font: dj_mediumFont(18), color: .green, alignment: .left, lineCount: 2, superView: view) { (make) in
            make.left.equalTo(220)
            make.top.equalTo(200)
            make.width.equalTo(100)
        }
    }
}

extension UIViewController {
    
    fileprivate func createButtonWithTitle() {
        
        UIButton(title: "login", titleFont: dj_regularFont(22), titleColor: .red, bgColor: .lightGray, superView: view, layoutClosure: { (make) in
            make.left.equalTo(50)
            make.top.equalTo(77)
            make.width.equalTo(88)
            make.height.equalTo(44)
        }) {
            print("login successfully!")
        }
    }
}
