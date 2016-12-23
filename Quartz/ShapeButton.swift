//
// Created by Dani Postigo on 11/27/16.
//

import Foundation
import UIKit
import QuartzCore

open class ShapeButton: UIButton {
    
    override open class var layerClass : AnyClass { return ShapeLayer.self }
    
    open var shapeLayer: CAShapeLayer { return self.shapingLayer!.maskLayer }
    open var shapingLayer: ShapeLayer? { return self.layer as? ShapeLayer }
    
    // MARK: Convenience
    
    convenience public init(path: UIBezierPath) {
        self.init(); self.shapeLayer.path = path.cgPath
    }
    
}


