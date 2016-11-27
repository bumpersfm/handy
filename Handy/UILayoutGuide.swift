//
// Created by Dani Postigo on 11/25/16.
//

import Foundation
import UIKit

extension UILayoutGuide {
    public func constrain(toSubview view: UIView) {
        view.preservesSuperviewLayoutMargins = true
        NSLayoutConstraint.activateConstraints([
            self.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor),
            self.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor),
            self.topAnchor.constraintEqualToAnchor(view.topAnchor),
            self.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor),
        ])
    }
}
