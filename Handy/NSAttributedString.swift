//
// Created by Dani Postigo on 12/15/16.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    
    public func replaceAttribute(attribute: String, value: AnyObject?) {
        guard var attributes = self.attributes else { return }
        if let value = value { attributes[attribute] = value } else { attributes.removeValueForKey(attribute) }
        self.attributes = attributes
    }
    
    override public var attributes: [String:AnyObject]? {
        get { return super.attributes }
        set {
            guard self.length > 0, let newValue = newValue else { return }
            self.setAttributes(newValue, range: self.stringRange)
        }
    }
    
}

extension NSAttributedString {
    private var stringRange: NSRange { return NSMakeRange(0, self.length) }
    
    public var attributes: [String:AnyObject]? {
        guard self.length > 0 else { return nil }
        return self.attributesAtIndex(0, longestEffectiveRange: nil, inRange: self.stringRange)
    }
}


