//
// Created by Dani Postigo on 11/27/16.
//

import Foundation
import UIKit
import QuartzCore


extension CAShapeLayer {
    
    public convenience init(path: CGPath?) {
        self.init(); self.path = path
    }
    
    public convenience init(frame: CGRect = CGRect.zero, lineWidth: CGFloat) {
        self.init(); self.lineWidth = lineWidth
    }
    
    public convenience init(frame: CGRect = CGRect.zero, fillColor: UIColor?, strokeColor: UIColor? = nil) {
        self.init(); self.set(fillColor: fillColor, strokeColor: strokeColor)
    }
    
    public func set(fillColor fillColor: UIColor? = nil, strokeColor: UIColor? = nil) {
        self.fillColor = fillColor?.CGColor
        self.strokeColor = strokeColor?.CGColor
    }
    
}
public class ShapeLayer: CALayer {
    
    public let maskLayer = CAShapeLayer()
    
    override public init() {
        super.init(); self.mask = self.maskLayer
    }
    
    required public init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    
}
