//
//  UIViewController+Extension.swift
//  DJExtension
//
//  Created by david on 2018/12/13.
//  Copyright © 2018 David Jia. All rights reserved.
//

import UIKit

public typealias djActionClosure = (UIAlertAction) -> Void

extension UIViewController {
    
    // quick way to push a new view controller
    public func dj_push(_ viewController: UIViewController) {
        guard let navigationController = navigationController else {
            return
        }
        navigationController.pushViewController(viewController, animated: true)
    }
    // quick way to pop back to previous view controller
    public func dj_pop() {
        guard let navigationController = navigationController else {
            return
        }
        navigationController.popViewController(animated: true)
    }
}

extension UIViewController {
    
    /// show action sheet with two options without cancel
    public func dj_showActionSheet(title: String? = nil, message: String? = nil, firstTitle: String, firstAction: @escaping djActionClosure, secondTitle: String, secondAction: @escaping djActionClosure) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: firstTitle, style: .default, handler: firstAction)
        let action2 = UIAlertAction(title: secondTitle, style: .default, handler: secondAction)
        let action3 = UIAlertAction(title: "取消", style: .cancel)
        
        action1.titleColor(dj_hexColor("333333"))
        action2.titleColor(dj_hexColor("333333"))
        action3.titleColor(dj_hexColor("333333"))

        alertController.addAction(action1)
        alertController.addAction(action2)
        alertController.addAction(action3)
        
        present(alertController, animated: true, completion: nil)
    }
    /// show action sheet with three options without cancel
    public func dj_showActionSheet(title: String? = nil, message: String? = nil, firstTitle: String, firstAction: @escaping djActionClosure, secondTitle: String, secondAction: @escaping djActionClosure, thirdTitle: String, thirdAction: @escaping djActionClosure) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: firstTitle, style: .default, handler: firstAction)
        let action2 = UIAlertAction(title: secondTitle, style: .default, handler: secondAction)
        let action3 = UIAlertAction(title: thirdTitle, style: .default, handler: thirdAction)
        let action4 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        action1.titleColor(dj_hexColor("333333"))
        action2.titleColor(dj_hexColor("333333"))
        action3.titleColor(dj_hexColor("333333"))
        action4.titleColor(dj_hexColor("333333"))
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        alertController.addAction(action3)
        alertController.addAction(action4)
        
        present(alertController, animated: true, completion: nil)
    }
    
    /// show a confirm dialog
    public func dj_showConfirmAlert(title: String = "", message: String = "", cancelTitle: String = "取消", buttonTitle: String = "确定", cancelAction: djActionClosure? = nil, confirmAction: @escaping djActionClosure) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelAction)

        let settingsAction = UIAlertAction(title: buttonTitle, style: .default, handler: confirmAction)
        
        alertController.addAction(cancelAction)
        alertController.addAction(settingsAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

