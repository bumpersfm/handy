//
//  UICollectionView.swift
//  Pods
//
//  Created by Dani Postigo on 8/31/16.
//
//

import Foundation

extension UICollectionView {

    public func scrollToItemAtIndexPath(indexPath: NSIndexPath, atScrollPosition scrollPosition: UICollectionViewScrollPosition, completion: ((Bool) -> Void)? = nil) {
        if let cell = self.cellForItemAtIndexPath(indexPath) {
            let point = self.pointForRect(CGRectOffset(cell.frame, -self.contentInset.left, -self.contentInset.top), atScrollPosition: scrollPosition)
            UIView.animateWithDuration(0.4, animations: { self.contentOffset = point }, completion: completion)
        }
    }

    private func pointForRect(rect: CGRect, atScrollPosition scrollPosition: UICollectionViewScrollPosition) -> CGPoint {
        switch scrollPosition {
            case UICollectionViewScrollPosition.Top: return CGPoint(x: rect.minX, y: rect.minY)
            case UICollectionViewScrollPosition.CenteredVertically: return CGPoint(x: rect.minX, y: rect.midY)
            case UICollectionViewScrollPosition.Bottom: return CGPoint(x: rect.minX, y: rect.maxY)
            case UICollectionViewScrollPosition.Left: return CGPoint(x: rect.minX, y: rect.minY)
            case UICollectionViewScrollPosition.CenteredHorizontally: return CGPoint(x: rect.midX, y: rect.minY)
            case UICollectionViewScrollPosition.Right: return CGPoint(x: rect.maxX, y: rect.minY)
            default: return self.contentOffset
        }
    }
}

extension UICollectionReusableView {

    public static var identifier: String {
        return String(self)
    }
}

extension UICollectionViewFlowLayout {
    public convenience init(scrollDirection: UICollectionViewScrollDirection) {
        self.init()
        self.scrollDirection = scrollDirection
    }
    public convenience init(scrollDirection: UICollectionViewScrollDirection, estimatedItemSize: CGSize) {
        self.init()
        self.scrollDirection = scrollDirection
        self.estimatedItemSize = estimatedItemSize
    }
}