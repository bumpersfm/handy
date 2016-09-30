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

    // MARK: Embed


    public func embed(view: UIView, identifier: String) {
        self.embed(view, insets: UIEdgeInsets(), identifier: identifier)
    }

    public func embed(view: UIView, insets: UIEdgeInsets, identifier: String) {
        self.addView(view, frame: self.bounds)
        view.topAnchor.constraintEqualToAnchor(self.topAnchor, constant: insets.top).identifier("\(identifier)top").active = true
        view.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor, constant: -insets.bottom).identifier("\(identifier)bottom").active = true
        view.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor, constant: insets.left).identifier("\(identifier)leading").active = true
        view.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor, constant: -insets.right).identifier("\(identifier)trailing").active = true
    }

    public func embed(view: UIView, insets: UIEdgeInsets = UIEdgeInsets()) {
        self.addView(view, frame: self.bounds)
        view.topAnchor.constraintEqualToAnchor(self.topAnchor, constant: insets.top).active = true
        view.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor, constant: -insets.bottom).active = true
        view.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor, constant: insets.left).active = true
        view.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor, constant: -insets.right).active = true
    }
}
