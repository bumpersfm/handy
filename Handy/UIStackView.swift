//
//  UIStackView.swift
//  Pods
//
//  Created by Dani Postigo on 8/31/16.
//
//

import Foundation
import UIKit

extension UIStackView {
    public convenience init(axis: UILayoutConstraintAxis) {
        self.init()
        self.axis = axis
    }
    
    public convenience init(axis: UILayoutConstraintAxis, spacing: CGFloat) {
        self.init()
        self.axis = axis
        self.spacing = spacing
    }

    public convenience init(axis: UILayoutConstraintAxis, spacing: CGFloat, alignment: UIStackViewAlignment) {
        self.init()
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
    }
    
    public convenience init(axis: UILayoutConstraintAxis, alignment: UIStackViewAlignment) {
        self.init()
        self.axis = axis
        self.alignment = alignment
    }
    public convenience init(axis: UILayoutConstraintAxis, alignment: UIStackViewAlignment, distribution: UIStackViewDistribution) {
        self.init()
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
    }
    
    public func addArrangedSubviews(views: [UIView]) {
        views.forEach(addArrangedSubview)
    }
}