//
//  NSLayoutConstraint.swift
//  Pods
//
//  Created by Dani Postigo on 8/31/16.
//
//

import Foundation
import UIKit

extension NSLayoutConstraint {
    public func identifier(identifier: String) -> Self {
        self.identifier = identifier
        return self
    }
    
    public func priority(priority: UILayoutPriority) -> Self {
        self.priority = priority
        return self
    }
}

extension Array where Element: NSLayoutConstraint {
    public func with(identifier identifier: String) -> NSLayoutConstraint? {
        return self.take({ $0.identifier == identifier })
    }
}