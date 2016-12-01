//
// Created by Dani Postigo on 11/25/16.
//

import Foundation
import UIKit

extension UILayoutGuide {
    
    public func anchor(withSubview view: UIView, insets: UIEdgeInsets? = nil) {
        view.preservesSuperviewLayoutMargins = true
        self.anchor(toViewFrame: view)
    }
    public func anchor(toViewFrame view: UIView, insets: UIEdgeInsets? = nil) {
        NSLayoutConstraint.activateConstraints([
            self.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor),
            self.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor),
            self.topAnchor.constraintEqualToAnchor(view.topAnchor),
            self.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor),
        ])
    }
}

extension UIView {
    
    public func anchor(view: UIView, layoutMargins margins: UIEdgeInsets? = nil) {
        self.addView(view)
        self.layoutMargins = margins ?? self.layoutMargins
        self.layoutMarginsGuide.anchor(withSubview: view)
    }
}
