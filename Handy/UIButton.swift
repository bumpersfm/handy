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



}
