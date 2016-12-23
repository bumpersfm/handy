//
// Created by Dani Postigo on 11/24/16.
//

import Foundation
import UIKit

@objc public protocol NotificationWindowDelegate: class {
    @objc optional func notificationTapped(_ notification: NotificationWindow)
    @objc optional func notificationWillPresent(_ notification: NotificationWindow)
    @objc optional func notificationPresented(_ notification: NotificationWindow)
    @objc optional func notificationWillAnimate(_ notification: NotificationWindow)
    @objc optional func notificationDismissed(_ notification: NotificationWindow)
}

open class NotificationWindow: UIWindow {

    open var presented: Bool = false
    open var dismissOnTap: Bool = false
    open weak var delegate: NotificationWindowDelegate? = nil

    open fileprivate(set) var contentView: UIView = UIView() { didSet { self.update(contentView: oldValue) } }
    fileprivate(set) var size: CGSize = CGSize.zero
    fileprivate var constraint: NSLayoutConstraint?

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

    open func show(inView window: UIView, animated: Bool = false, completion: Block? = nil, options: AnimationOptions) {
        self.add(toView: window)
        self.show(animated: animated, options: options, completion: completion)
    }

    open func show(inViewController vc: UIViewController, animated: Bool = false, completion: Block? = nil, options: AnimationOptions) {
        self.add(toViewController: vc)
        self.show(animated: animated, options: options, completion: completion)
    }
    
    open func show(animated: Bool = false, completion: Block? = nil) {
        self.show(animated: animated, options: AnimationOptions(duration: 0.4, options: UIViewAnimationOptions()), completion: completion)
    }
    
    open func show(animated: Bool = false, options: AnimationOptions, completion: Block? = nil) {
        guard self.superview != nil else { return }
        self.constraint?.constant = self.size.height
        guard animated else { self.presented(completion: completion); return }

        UIView.animateWithOptions(options,
            animations: { self.superview?.layoutIfNeeded() },
            completion: { _ in self.presented(completion: completion) })
    }

    open func hide(animated: Bool = false, completion: Block? = nil) {
        self.delegate?.notificationWillAnimate?(self)
        guard animated else { self.dismissed(completion: completion); return }
        UIView.transition(with: self, duration: 0.45, options: UIViewAnimationOptions(),
            animations: { self.isHidden = true },
            completion: { _ in self.dismissed(completion: completion) })
    }

    // MARK: Actions

    open func tapped(_ sender: AnyObject? = nil) {
        self.delegate?.notificationTapped?(self)
        guard self.dismissOnTap else { return }
        self.hide(animated: true)
    }


    // MARK: Event handlers

    fileprivate func presented(completion: Block? = nil) {
        self.presented = true
        self.delegate?.notificationPresented?(self); completion?()
    }

    fileprivate func dismissed(completion: Block? = nil) {
        self.presented = false
        self.isHidden = true
        self.delegate?.notificationDismissed?(self); completion?()
    }

    // MARK: Convenience

    fileprivate func add(toViewController vc: UIViewController) {
        self.add(toView: vc.view, topAnchor: vc.topLayoutGuide.topAnchor)
    }

    fileprivate func add(toView window: UIView) {
        self.add(toView: window, topAnchor: window.topAnchor)
    }

    fileprivate func add(toView window: UIView, topAnchor: NSLayoutYAxisAnchor) {
        self.frame.size.width = window.bounds.size.width
        window.addView(self)

        self.delegate?.notificationWillPresent?(self)
        self.leadingAnchor.constraint(equalTo: window.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: window.trailingAnchor).isActive = true
        self.constraint = self.bottomAnchor.constraint(equalTo: topAnchor as! NSLayoutAnchor<NSLayoutYAxisAnchor>)
        self.constraint?.isActive = true
        self.superview?.layoutIfNeeded()
        self.delegate?.notificationWillAnimate?(self)
    }
    
    // MARK: Private methods
    
    fileprivate func update(contentView oldValue: UIView) {
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
