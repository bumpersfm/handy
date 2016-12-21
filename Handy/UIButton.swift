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
    public convenience init(title: String) {
        self.init(); self.setTitle(title, forState: .Normal)
    }
    public convenience init(title: String, font: UIFont) {
        self.init(title: title)
        self.titleLabel?.font = font
    }
    
    public convenience init(title: String, font: UIFont, color: UIColor) {
        self.init(title: title, font: font)
        self.setTitleColor(color, forState: .Normal)
    }
    
    public convenience init(title: String, backgroundColor: UIColor) {
        self.init(title: title); self.backgroundColor = backgroundColor
    }
    
    public convenience init(title: String, font: UIFont, color: UIColor, backgroundColor: UIColor) {
        self.init(title: title, font: font, color: color)
        self.backgroundColor = backgroundColor
    }
    
    public convenience init(title: String, font: UIFont, color: UIColor, contentEdgeInsets: UIEdgeInsets) {
        self.init(title: title, font: font, color: color)
        self.contentEdgeInsets = contentEdgeInsets
    }
    
    public convenience init(title: String, titleColor: UIColor) {
        self.init(title: title); self.setTitleColor(titleColor, forState: .Normal)
    }
    
    public convenience init(attributedTitle: NSAttributedString) {
        self.init()
        self.setAttributedTitle(attributedTitle, forState: .Normal)
    }
    
    public convenience init(image: UIImage?) {
        self.init()
        self.setImage(image, forState: .Normal)
    }
    
    public convenience init(image: UIImage?, selectedImage: UIImage?) {
        self.init(image: image); self.setImage(selectedImage, forState: .Selected)
    }
    
    public convenience init(image: UIImage?, contentEdgeInsets: UIEdgeInsets) {
        self.init(image: image)
        self.contentEdgeInsets = contentEdgeInsets
    }
    
    public convenience init(userInteractionEnabled: Bool) {
        self.init()
        self.userInteractionEnabled = userInteractionEnabled
    }
    
    // MARK:
    
    public convenience init(title: String, color: UIColor) {
        self.init(title: title, titleColor: color)
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
