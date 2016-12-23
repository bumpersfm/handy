//
// Created by Dani Postigo on 11/24/16.
//

import Foundation
import UIKit

open class ControlBar: UIView {

    open var titleView = UIView() {
        didSet { self.update(titleView: self.titleView, oldValue: oldValue) }
    }

    open var leftViews = [UIView]() {
        didSet { self.update(leftViews: self.leftViews, oldValue: oldValue) }
    }

    open var rightViews = [UIView]() {
        didSet { self.update(rightViews: self.rightViews, oldValue: oldValue) }
    }


    fileprivate let stack = UIStackView(axis: .horizontal)

    // MARK: Init

    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.layoutMargins = UIEdgeInsets.zero
        self.stack.preservesSuperviewLayoutMargins = true
        self.stack.isLayoutMarginsRelativeArrangement = true
        self.stack.addArrangedSubview(self.titleView)

        self.addView(self.stack)
        NSLayoutConstraint.activate([
            self.layoutMarginsGuide.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            self.layoutMarginsGuide.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            self.layoutMarginsGuide.topAnchor.constraint(equalTo: stack.topAnchor),
            self.layoutMarginsGuide.bottomAnchor.constraint(equalTo: stack.bottomAnchor)
        ])
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: Private methods

    fileprivate func update(leftViews views: [UIView], oldValue old: [UIView]) {
        self.stack.removeArrangedSubviews(old)
        old.forEach({ $0.removeFromSuperview() })
        views.reversed().forEach({ self.stack.insertArrangedSubview($0, at: 0) })
    }

    fileprivate func update(rightViews views: [UIView], oldValue old: [UIView]) {
        self.stack.removeArrangedSubviews(old)
        old.forEach({ $0.removeFromSuperview() })
        self.stack.addArrangedSubviews(views)
    }

    fileprivate func update(titleView view: UIView, oldValue old: UIView) {
        if let index = self.stack.arrangedSubviews.index(of: old) {
            self.stack.insertArrangedSubview(view, at: index)
            self.stack.removeArrangedSubview(old)
            old.removeFromSuperview()
        }
    }

}
