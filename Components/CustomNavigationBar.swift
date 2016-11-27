//
// Created by Dani Postigo on 11/27/16.
//

import Foundation
import UIKit


public class CustomNavigationBar: UINavigationBar {
    
    public var customHeight: CGFloat = 44 {
        didSet { self.frame.size.height = self.customHeight; self.invalidateIntrinsicContentSize() }
    }
    
    override public func intrinsicContentSize() -> CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: self.customHeight)
    }
    
    override public func sizeThatFits(size: CGSize) -> CGSize {
        return CGSize(width: super.sizeThatFits(size).width, height: self.intrinsicContentSize().height)
    }
    
}

extension UINavigationController {
    public var customNavigationBar: CustomNavigationBar? { return self.navigationBar as? CustomNavigationBar }
}