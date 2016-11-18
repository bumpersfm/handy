//
//  UIViewController.swift
//  Pods
//
//  Created by Dani Postigo on 8/31/16.
//
//

import Foundation
import UIKit

extension UIViewController {
    public convenience init(color: UIColor) {
        self.init(); self.view.backgroundColor = color
    }

    public convenience init(tabBarItem: UITabBarItem) {
        self.init(); self.tabBarItem = tabBarItem
    }

    public func dismiss(sender: AnyObject? = nil) {
        self.dismiss(animated: true)
    }

    public func dismiss(animated animated: Bool) {
        if self.presentingViewController != nil {
            self.dismissViewControllerAnimated(animated, completion: nil)
        } else if let nav = self.navigationController {
            nav.popViewControllerAnimated(animated)
        }
    }
}

extension UINavigationController {
    public convenience init(rootViewController: UIViewController, navigationBarHidden: Bool) {
        self.init(rootViewController: rootViewController)
        self.navigationBarHidden = navigationBarHidden
    }
}
