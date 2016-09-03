//
//  UIViewController.swift
//  Pods
//
//  Created by Dani Postigo on 8/31/16.
//
//

import Foundation

extension UIViewController {
    public convenience init(color: UIColor) {
        self.init()
        self.view.backgroundColor = color
    }
}

extension UINavigationController {
    public convenience init(rootViewController: UIViewController, navigationBarHidden: Bool) {
        self.init(rootViewController: rootViewController)
        self.navigationBarHidden = navigationBarHidden
    }
}
