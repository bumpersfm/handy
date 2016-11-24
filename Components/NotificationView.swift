//
// Created by Dani Postigo on 11/24/16.
//

import Foundation
import UIKit

@objc public protocol NotificationViewDelegate: class {
    optional func notificationTapped(notification: NotificationView)
    optional func notificationWillPresent(notification: NotificationView)
    optional func notificationPresented(notification: NotificationView)
    optional func notificationWillAnimate(notification: NotificationView)
    optional func notificationDismissed(notification: NotificationView)
}

public class NotificationView: UIView {

    public var presented: Bool = false
    public var dismissOnTap: Bool = false
    public weak var delegate: NotificationViewDelegate? = nil


    private let contentView: UIView
    private(set)var size: CGSize = CGSize.zero
    private var constraint: NSLayoutConstraint?

    // MARK: Init

    public init(withView contentView: UIView) {
        self.contentView = contentView
        super.init(frame: self.contentView.bounds)
        self.size = self.contentView.frame.size
        self.embed(self.contentView)
        self.heightAnchor.constraintEqualToConstant(size.height).active = true
    }

    // MARK: Show / hide

    public func show(inView window: UIView, animated: Bool = false, completion: Block? = nil, duration: NSTimeInterval = 0.4) {
        self.add(toView: window)
        self.show(animated: animated, completion: completion, duration: duration)
    }

    public func show(inViewController vc: UIViewController, animated: Bool = false, completion: Block? = nil, duration: NSTimeInterval = 0.4) {
        self.add(toViewController: vc)
        self.show(animated: animated, completion: completion, duration: duration)
    }

    public func show(animated animated: Bool = false, completion: Block? = nil, duration: NSTimeInterval = 0.4) {
        guard let window = self.superview else { return }
        self.constraint?.constant = self.size.height
        guard animated else { self.presented(completion: completion); return }

        UIView.animateWithDuration(duration, options: .CurveEaseInOut,
            animations: { self.superview?.layoutIfNeeded() },
            completion: { _ in self.presented(completion: completion) })
    }

    public func hide(animated animated: Bool = false, completion: Block? = nil) {
        self.constraint?.constant = 0
        self.delegate?.notificationWillAnimate?(self)
        guard animated else { self.dismissed(completion: completion); return }
        UIView.animateWithDuration(0.45,
            animations: { self.superview?.layoutIfNeeded() },
            completion: { _ in self.removeFromSuperview(); self.dismissed(completion: completion) })
    }

    // MARK: Actions

    func tapped(sender: AnyObject? = nil) {
        self.delegate?.notificationTapped?(self)
        guard self.dismissOnTap else { return }
        self.hide(animated: true)
    }


    // MARK: Event handlers

    private func presented(completion completion: Block? = nil) {
        self.presented = true
        self.addGesture(UITapGestureRecognizer(target: self, action: #selector(tapped(_:))))
        self.delegate?.notificationPresented?(self); completion?()
    }

    private func dismissed(completion completion: Block? = nil) {
        self.presented = false
        self.delegate?.notificationDismissed?(self); completion?()
    }

    // MARK: Convenience

    private func add(toViewController vc: UIViewController) {
        self.add(toView: vc.view, topAnchor: vc.topLayoutGuide.topAnchor)
    }

    private func add(toView window: UIView) {
        self.add(toView: window, topAnchor: window.topAnchor)
    }

    private func add(toView window: UIView, topAnchor: NSLayoutAnchor) {
        self.frame.size.width = window.bounds.size.width
        window.addView(self)

        self.delegate?.notificationWillPresent?(self)
        self.leadingAnchor.constraintEqualToAnchor(window.leadingAnchor).active = true
        self.trailingAnchor.constraintEqualToAnchor(window.trailingAnchor).active = true
        self.constraint = self.bottomAnchor.constraintEqualToAnchor(topAnchor)
        self.constraint?.active = true
        self.superview?.layoutIfNeeded()
        self.delegate?.notificationWillAnimate?(self)
    }

    // MARK:

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}