//
// Created by Dani Postigo on 11/27/16.
//

import Foundation
import UIKit
import QuartzCore

public class ShapeButton: UIButton {
    
    override public class func layerClass() -> AnyClass { return ShapeLayer.self }
    
    public var shapeLayer: CAShapeLayer { return self.shapingLayer!.maskLayer }
    public var shapingLayer: ShapeLayer? { return self.layer as? ShapeLayer }
    
    // MARK: Convenience
    
    convenience public init(path: UIBezierPath) {
        self.init(); self.shapeLayer.path = path.CGPath
    }
    
}


