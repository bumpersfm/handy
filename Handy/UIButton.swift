//
//  UIButton.swift
//  Pods
//
//  Created by Dani Postigo on 8/31/16.
//
//

import Foundation
import UIKit

extension UIButton {
    
    public convenience init(title: String, color: UIColor? = nil, font: UIFont? = nil, backgroundColor: UIColor? = nil, contentEdgeInsets: UIEdgeInsets = UIEdgeInsetsZero) {
        self.init()
        self.setTitle(title, forState: .Normal)
        self.setTitleColor(color, forState: .Normal)
        self.titleLabel?.font = font
        self.backgroundColor = backgroundColor
        self.contentEdgeInsets = contentEdgeInsets
    }

    public convenience init(title: String, titleColor: UIColor) {
        self.init(title: title, color: titleColor)
    }

    public convenience init(attributedTitle: NSAttributedString) {
        self.init(); self.setAttributedTitle(attributedTitle, forState: .Normal)
    }

    public convenience init(image: UIImage?, selectedImage: UIImage? = nil, contentEdgeInsets: UIEdgeInsets = UIEdgeInsetsZero) {
        self.init()
        self.setImage(image, forState: .Normal)
        self.setImage(selectedImage, forState: .Selected)
        self.contentEdgeInsets = contentEdgeInsets
    }

    public convenience init(userInteractionEnabled: Bool) {
        self.init(); self.userInteractionEnabled = userInteractionEnabled
    }

    // MARK: Attributed strings
    
    public var attributes: [String: AnyObject]? {
        set {
            guard let newValue = newValue, current = self.attributedTitle else { return }
            self.attributedTitle = NSAttributedString(string: current.string, attributes: newValue)
        }
        get { return self.attributesForState(self.state) }
    }
    
    public var attributedTitle: NSAttributedString? {
        get { return self.currentAttributedTitle }
        set { self.setAttributedTitle(newValue, forState: self.state) }
    }
    
    public func replaceAttribute(attribute: String, value: AnyObject?) {
        guard let string = self.currentMutableAttributedTitle else { return }
        string.replaceAttribute(attribute, value: value)
        self.attributedTitle = string
    }
    
    func attributesForState(state: UIControlState) -> [String: AnyObject]? {
        guard let string = self.attributedTitleForState(state) else { return nil }
        return string.attributesAtIndex(0, longestEffectiveRange: nil, inRange: NSMakeRange(0, string.length))
    }
    
    private var currentMutableAttributedTitle: NSMutableAttributedString? {
        return self.currentAttributedTitle?.mutableCopy() as? NSMutableAttributedString
    }
}
