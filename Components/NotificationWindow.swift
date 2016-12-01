//
// Created by Dani Postigo on 11/24/16.
//

import Foundation
import UIKit

@objc public protocol NotificationWindowDelegate: class {
    optional func notificationTapped(notification: NotificationWindow)
    optional func notificationWillPresent(notification: NotificationWindow)
    optional func notificationPresented(notification: NotificationWindow)
    optional func notificationWillAnimate(notification: NotificationWindow)
    optional func notificationDismissed(notification: NotificationWindow)
}

public class NotificationWindow: UIWindow {

    public var presented: Bool = false
    public var dismissOnTap: Bool = false
    public weak var delegate: NotificationWindowDelegate? = nil

    public private(set) var contentView: UIView = UIView() { didSet { self.update(contentView: oldValue) } }
    private(set) var size: CGSize = CGSize.zero
    private var constraint: NSLayoutConstraint?

    // MARK: Init
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        Swift.print("NotificationWindow.\(#function)")
        self.windowLevel = App.keyWindow?.windowLevel ?? UIWindowLevelNormal
        self.addGesture(UITapGestureRecognizer(target: self, action: #selector(tapped(_:))))
    }
    
    // MARK: Show / hide

    public func show(inView window: UIView, animated: Bool = false, completion: Block? = nil, options: AnimationOptions) {
        self.add(toView: window)
        self.show(animated: animated, options: options, completion: completion)
    }

    public func show(inViewController vc: UIViewController, animated: Bool = false, completion: Block? = nil, options: AnimationOptions) {
        self.add(toViewController: vc)
        self.show(animated: animated, options: options, completion: completion)
    }
    
    public func show(animated animated: Bool = false, completion: Block? = nil) {
        self.show(animated: animated, options: AnimationOptions(duration: 0.4, options: .CurveEaseInOut), completion: completion)
    }
    
    public func show(animated animated: Bool = false, options: AnimationOptions, completion: Block? = nil) {
        guard self.superview != nil else { return }
        self.constraint?.constant = self.size.height
        guard animated else { self.presented(completion: completion); return }

        UIView.animateWithOptions(options,
            animations: { self.superview?.layoutIfNeeded() },
            completion: { _ in self.presented(completion: completion) })
    }

    public func hide(animated animated: Bool = false, completion: Block? = nil) {
        self.delegate?.notificationWillAnimate?(self)
        guard animated else { self.dismissed(completion: completion); return }
        UIView.transitionWithView(self, duration: 0.45, options: .CurveEaseInOut,
            animations: { self.hidden = true },
            completion: { _ in self.dismissed(completion: completion) })
    }

    // MARK: Actions

    public func tapped(sender: AnyObject? = nil) {
        self.delegate?.notificationTapped?(self)
        guard self.dismissOnTap else { return }
        self.hide(animated: true)
    }


    // MARK: Event handlers

    private func presented(completion completion: Block? = nil) {
        self.presented = true
        self.delegate?.notificationPresented?(self); completion?()
    }

    private func dismissed(completion completion: Block? = nil) {
        self.presented = false
        self.hidden = true
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
    
    // MARK: Private methods
    
    private func update(contentView oldValue: UIView) {
        oldValue.removeFromSuperview()
        self.size = self.contentView.frame.size
        self.embed(self.contentView)
    }

    // MARK: Convenience
    
    convenience public init(withView contentView: UIView) {
        self.init(frame: contentView.bounds)
        Swift.print("NotificationWindow.\(#function)")
        ({ self.contentView = contentView })()
    }
    
    
}
