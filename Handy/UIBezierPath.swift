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

extension UIBezierPath {

    // MARK: Triangle shape

    public convenience init(triangleInRect rect: CGRect, edge: UIRectEdge) {
        self.init()
        switch edge {
            case UIRectEdge.Top:
                self.moveToPoint(CGPoint(x: rect.minX, y: rect.maxY))
                self.addLineToPoint(CGPoint(x: rect.midX, y: rect.minY))
                self.addLineToPoint(CGPoint(x: rect.maxX, y: rect.maxY))
                self.addLineToPoint(CGPoint(x: rect.minX, y: rect.maxY))
            case UIRectEdge.Bottom:
                self.moveToPoint(CGPoint(x: rect.minX, y: rect.minY))
                self.addLineToPoint(CGPoint(x: rect.midX, y: rect.maxY))
                self.addLineToPoint(CGPoint(x: rect.maxX, y: rect.minY))
                self.addLineToPoint(CGPoint(x: rect.minX, y: rect.minY))
            case UIRectEdge.Left:
                self.moveToPoint(CGPoint(x: rect.maxX, y: rect.minY))
                self.addLineToPoint(CGPoint(x: rect.minX, y: rect.midY))
                self.addLineToPoint(CGPoint(x: rect.maxX, y: rect.maxY))
                self.addLineToPoint(CGPoint(x: rect.maxX, y: rect.minY))
            case UIRectEdge.Right:
                self.moveToPoint(CGPoint(x: rect.minX, y: rect.minY))
                self.addLineToPoint(CGPoint(x: rect.maxX, y: rect.midY))
                self.addLineToPoint(CGPoint(x: rect.minX, y: rect.maxY))
                self.addLineToPoint(CGPoint(x: rect.minX, y: rect.minY))
            default: break
        }
        self.closePath()
    }

    // MARK: Popover shapes

    public convenience init(popoverInRect rect: CGRect, withSize size: CGSize, edge: UIRectEdge = .Bottom, cornerRadius: CGFloat = 0) {
        let rect = edge.offset(popoverRect: rect, forArrowSize: size)
        self.init(roundedRect: rect, cornerRadius: cornerRadius)
        self.append(popoverArrowOfSize: size, forEdge: edge)
    }

    public func append(popoverArrowOfSize size: CGSize, forEdge edge: UIRectEdge = .Bottom) {
        let bounds = self.bounds
        var rect = CGRect(size: size)
        switch edge {
            case UIRectEdge.Top:    rect.origin = CGPoint(x: bounds.midX - (size.width * 0.5), y: bounds.minY - size.height)
            case UIRectEdge.Bottom: rect.origin = CGPoint(x: bounds.midX - (size.width * 0.5), y: bounds.maxY)
            case UIRectEdge.Left:   rect.origin = CGPoint(x: bounds.minX - size.width, y: bounds.midY - (size.height * 0.5))
            case UIRectEdge.Right:  rect.origin = CGPoint(x: bounds.maxX, y: bounds.midY - (size.height * 0.5))
            default: break
        }
        self.appendPath(UIBezierPath(triangleInRect: rect, edge: edge))
    }

}

extension UIRectEdge {
    private func offset(popoverRect rect: CGRect, forArrowSize size: CGSize) -> CGRect {
        var rect = rect
        switch self {
            case UIRectEdge.Top:    rect = CGRectOffset(rect, 0, size.height)
            case UIRectEdge.Bottom: rect = CGRectOffset(rect, 0, -size.height)
            case UIRectEdge.Left:   rect = CGRectOffset(rect, size.width, 0)
            case UIRectEdge.Right:  rect = CGRectOffset(rect, -size.width, 0)
            default:break
        }
        return rect
    }
}