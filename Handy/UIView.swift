//
//  UIView.swift
//  Pods
//
//  Created by Dani Postigo on 8/31/16.
//
//

import Foundation
import UIKit

extension UIView {
    
    public convenience init(color: UIColor) {
        self.init()
        self.backgroundColor = color
    }

    public func addView(view: UIView, frame: CGRect = CGRectNull) {
        view.frame = frame == CGRectNull ? view.frame : self.bounds
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }

    public func addSubviews(views: [UIView]) {
        views.forEach({ self.addView($0) })
    }

    public func removeAllSubviews() {
        self.subviews.forEach({ $0.removeFromSuperview() })
    }

}
