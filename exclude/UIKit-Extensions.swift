//
// Created by Daniela Postigo on 5/31/16.
// Copyright (c) 2016 Bumpers Media Inc. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    static func color(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
}


// https://twitter.com/sommer/status/750468970361131008
extension UICollectionView {
    func registerClass<T:UICollectionViewCell>(cellClass: T.Type) {
        self.registerClass(cellClass, forCellWithReuseIdentifier: UICollectionViewCell.reuseIdentifier(cellClass))
    }

    func dequeueReusableCell<T:UICollectionViewCell>(indexPath indexPath: NSIndexPath) -> T {
        return self.dequeueReusableCellWithReuseIdentifier(UICollectionViewCell.reuseIdentifier(T.self), forIndexPath: indexPath) as! T
    }
}
extension UICollectionViewCell {
    static func reuseIdentifier<T:UICollectionViewCell>(className: T.Type) -> String {
        return NSBundle.mainBundle().bundleIdentifier! + String(className)
    }
}
//
extension UITableView {
    //    func registerClass<T:UITableViewCell>(class cellClass: T.Type) {
    //        self.registerClass(cellClass, forCellReuseIdentifier: UITableViewCell.reuseIdentifier(cellClass))
    //    }
    //
    //    func dequeueReusableCell<T:UITableViewCell>(indexPath indexPath: NSIndexPath) -> T {
    //        return self.dequeueReusableCellWithIdentifier(UITableViewCell.reuseIdentifier(T.self), forIndexPath: indexPath) as! T
    //    }
    //    func registerClass<T:UITableViewHeaderFooterView>(cellClass: T.Type) {
    //        self.registerClass(cellClass, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier(cellClass))
    //    }

    func dequeueReusableHeaderView<T:UITableViewHeaderFooterView>() -> T? {
        return self.dequeueReusableHeaderFooterViewWithIdentifier(T.reuseIdentifier(T.self)) as? T
    }
}

//extension UITableViewCell {
//    static func reuseIdentifier<T:UITableViewCell>(className: T.Type) -> String {
//        return NSBundle.mainBundle().bundleIdentifier! + String(className)
//    }
//}
//
extension UITableViewHeaderFooterView {

    static func reuseIdentifier() -> String {
        return self.reuseIdentifier(UITableViewHeaderFooterView.self)
    }
    static func reuseIdentifier<T:UITableViewHeaderFooterView>(className: T.Type) -> String {
        return NSBundle.mainBundle().bundleIdentifier! + String(className)
    }
}

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(Self.self)
    }
}

extension UITableViewCell: Reusable {
}
extension UITableView {

    func register<T:UITableViewCell where T: Reusable>(_: T.Type) {
        //        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
        registerClass(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeue<T:UITableViewCell where T: Reusable>(_: T.Type, for indexPath: NSIndexPath) -> T {
        return self.dequeueReusableCellWithIdentifier(T.reuseIdentifier, forIndexPath: indexPath) as! T
        //        return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T;
    }
}



extension CollectionType where Generator.Element: NSObjectProtocol {

}



extension UIView {
    

    public func alpha(value: CGFloat) -> Self {
        self.alpha = value
        return self
    }

    public func renderImage(rect rect: CGRect) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
        self.drawViewHierarchyInRect(self.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}



// MARK: Autolayout

//extension UIView {
//
//    public func embed(view: UIView, identifier: String) {
//        self.embed(view, insets: UIEdgeInsets(), identifier: identifier)
//    }
//
//    public func embed(view: UIView, insets: UIEdgeInsets, identifier: String) {
//        self.addView(view.forAutolayout(), frame: self.bounds)
//        view.topAnchor.constraintEqualToAnchor(self.topAnchor, constant: insets.top).identifier("\(identifier)top").active = true
//        view.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor, constant: -insets.bottom).identifier("\(identifier)bottom").active = true
//        view.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor, constant: insets.left).identifier("\(identifier)leading").active = true
//        view.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor, constant: -insets.right).identifier("\(identifier)trailing").active = true
//    }
//
//
//    public func embed(view: UIView, insets: UIEdgeInsets = UIEdgeInsets()) {
//        self.addView(view.forAutolayout(), frame: self.bounds)
//        view.topAnchor.constraintEqualToAnchor(self.topAnchor, constant: insets.top).active = true
//        view.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor, constant: -insets.bottom).active = true
//        view.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor, constant: insets.left).active = true
//        view.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor, constant: -insets.right).active = true
//    }
//
//    public func addView(view: UIView, frame: CGRect = CGRectNull) {
//        view.frame = frame == CGRectNull ? view.frame : self.bounds
//        self.addSubview(view.forAutolayout())
//    }
//
//    public func addSubviews(views: [UIView]) {
//        views.forEach({ self.addView($0) })
//    }
//
//    public func pin(view: UIView, axis: UILayoutConstraintAxis, insets: UIEdgeInsets = UIEdgeInsets()) {
//        switch axis {
//        case .Horizontal:
//            view.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor, constant: insets.left).active = true
//            view.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor, constant: -insets.right).active = true
//
//        case .Vertical:
//            view.topAnchor.constraintEqualToAnchor(self.topAnchor, constant: insets.top).active = true
//            view.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor, constant: -insets.bottom).active = true
//        }
//    }
//
//    public func pinToCenter(view: UIView, axis: UILayoutConstraintAxis) {
//        switch axis {
//        case .Horizontal:
//            view.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
//
//        case .Vertical:
//            view.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor).active = true
//        }
//    }
//}

extension UIViewController {

    //public func embed(view: UIView, identifier: String = "") {
    //self.embed(view, insets: UIEdgeInsets(), identifier: identifier)
    //}

    public func addChildViewController(vc: UIViewController, inView: UIView) {
        self.addChildViewController(vc)
        inView.addView(vc.view)
    }

//    public func embed(object: AnyObject, insets: UIEdgeInsets = UIEdgeInsets(), identifier: String = "") {
//        if let view = object as? UIView {
//            self.embed(view: view, insets: insets, identifier: identifier)
//        } else if let viewController = object as? UIViewController {
//            self.embed(viewController: viewController, insets: insets, identifier: identifier)
//
//        }
//    }
//
//    public func embed(viewController viewController: UIViewController, insets: UIEdgeInsets = UIEdgeInsets(), identifier: String = "") {
//        self.embed(viewController.view, insets: insets, identifier: identifier)
//    }

//    public func embed(view view: UIView, insets: UIEdgeInsets = UIEdgeInsets(), identifier: String = "") {
//        self.view.addView(view.forAutolayout(), frame: self.view.bounds)
//
//        view.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: insets.top)
//        .identifier("\(identifier)top").active = true
//
//        view.bottomAnchor.constraintEqualToAnchor(self.bottomLayoutGuide.topAnchor, constant: -insets.bottom)
//        .identifier("\(identifier)bottom").active = true
//
//        view.leadingAnchor.constraintEqualToAnchor(self.view.leadingAnchor, constant: insets.left)
//        .identifier("\(identifier)leading").active = true
//
//        view.trailingAnchor.constraintEqualToAnchor(self.view.trailingAnchor, constant: -insets.right)
//        .identifier("\(identifier)trailing").active = true
//    }

    // MARK: Fullscreen
//
//    public func fullscreen(object: AnyObject, insets: UIEdgeInsets = UIEdgeInsets(), identifier: String = "") {
//        if let view = object as? UIView {
//            self.fullscreen(view: view, insets: insets, identifier: identifier)
//        } else if let viewController = object as? UIViewController {
//            self.fullscreen(viewController: viewController, insets: insets, identifier: identifier)
//
//        }
//    }
//
//    public func fullscreen(view view: UIView, insets: UIEdgeInsets = UIEdgeInsets(), identifier: String = "") {
//        self.view.addView(view.forAutolayout(), frame: self.view.bounds)
//
//        view.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.topAnchor, constant: insets.top)
//        .identifier("\(identifier)top").active = true
//
//        view.bottomAnchor.constraintEqualToAnchor(self.bottomLayoutGuide.topAnchor, constant: -insets.bottom)
//        .identifier("\(identifier)bottom").active = true
//
//        view.leadingAnchor.constraintEqualToAnchor(self.view.leadingAnchor, constant: insets.left)
//        .identifier("\(identifier)leading").active = true
//
//        view.trailingAnchor.constraintEqualToAnchor(self.view.trailingAnchor, constant: -insets.right)
//        .identifier("\(identifier)trailing").active = true
//    }

//    public func fullscreen(viewController viewController: UIViewController, insets: UIEdgeInsets = UIEdgeInsets(), identifier: String = "") {
//        self.fullscreen(viewController.view, insets: insets, identifier: identifier)
//    }
}

// MARK: NSLayoutConstraint identifier

extension UIView {
//    public func constraintWithIdentifier(identifier: String) -> NSLayoutConstraint? {
//        return self.constraints.take(identifier: identifier)
//    }
}



//extension Array where Element: NSLayoutConstraint {
//    func take(identifier identifier: String) -> NSLayoutConstraint? {
//        return self.select({ $0.identifier == identifier })
//    }
//}

// MARK: UIView Classes

class PassThroughView: UIView {
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, withEvent: event)
        return view == self ? nil : view
    }
}

class CircleView: UIView {
    var radius: CGFloat = 10
    let shapeLayer = CAShapeLayer()

    convenience init(color: UIColor, radius: CGFloat) {
        self.init(color: color)
        self.radius = radius
    }

    convenience init(radius: CGFloat) {
        self.init()
        self.radius = radius
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.mask = shapeLayer
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        shapeLayer.frame = self.bounds
        shapeLayer.path = UIBezierPath(ovalInRect: self.bounds).CGPath
    }

    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: self.radius, height: self.radius)
    }

}



//
//extension UIViewControllerContextTransitioning {
//
//    public var toView: UIView? {
//        return self.viewForKey(UITransitionContextToViewKey)
//    }
//    public var toViewController: UIViewController? {
//        return self.viewControllerForKey(UITransitionContextToViewControllerKey)
//    }
//
//    public var toInitialFrame: CGRect {
//        return self.initialFrameForViewController(self.toViewController!)
//    }
//
//    public var toFinalFrame: CGRect {
//        return self.finalFrameForViewController(self.toViewController!)
//    }
//
//    public var fromView: UIView? {
//        return self.viewForKey(UITransitionContextFromViewKey)
//    }
//
//    public var fromViewController: UIViewController? {
//        return self.viewControllerForKey(UITransitionContextFromViewControllerKey)
//    }
//
//    public var fromInitialFrame: CGRect {
//        return self.initialFrameForViewController(self.fromViewController!)
//    }
//
//    public var fromFinalFrame: CGRect {
//        return self.finalFrameForViewController(self.fromViewController!)
//    }
//}




