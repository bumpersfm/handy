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

    public convenience init(axis: UILayoutConstraintAxis, alignment: UIStackViewAlignment = .Fill, distribution: UIStackViewDistribution = .Fill, views: [UIView] = [], spacing: CGFloat = 10) {
        self.init()
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        self.addArrangedSubviews(views)
    }
    
    public func addArrangedSubviews(views: [UIView]) {
        views.forEach(addArrangedSubview)
    }

    public func removeArrangedSubviews(views: [UIView]) {
        views.forEach(removeArrangedSubview)
    }
}