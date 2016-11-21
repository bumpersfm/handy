//
// Created by Dani Postigo on 11/21/16.
//

import Foundation
import UIKit


extension UINavigationBar {
    public func centerTitleVerticalPositionAdjustment(forView titleView: UIView) {
        let adjustment = self.frame.size.height - titleView.frame.size.height
        self.setTitleVerticalPositionAdjustment(adjustment * -0.5, forBarMetrics: .Default)
    }
}
