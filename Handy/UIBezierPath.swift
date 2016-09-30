//
// Created by Dani Postigo on 10/3/16.
//

import Foundation
import UIKit

extension UIBezierPath {

    public convenience init(circleWithRadius radius: CGFloat) {
        self.init(ovalInRect: CGRect(width: radius, height: radius))

    }
}
