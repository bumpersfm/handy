//
// Created by Dani Postigo on 11/27/16.
//

import Foundation
import UIKit


open class CustomNavigationBar: UINavigationBar {
    
    open var customHeight: CGFloat = 44 {
        didSet { self.frame.size.height = self.customHeight; self.invalidateIntrinsicContentSize() }
    }
    
    override open var intrinsicContentSize : CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: self.customHeight)
    }
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: super.sizeThatFits(size).width, height: self.intrinsicContentSize.height)
    }
    
}

extension UINavigationController {
    public var customNavigationBar: CustomNavigationBar? { return self.navigationBar as? CustomNavigationBar }
}
