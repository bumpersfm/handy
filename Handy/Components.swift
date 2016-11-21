//
// Created by Dani Postigo on 11/21/16.
//

import Foundation
import UIKit

public class CustomTitleView: ControlBar {

    public let textLabel = UILabel(title: "Title", color: UIColor.whiteColor(), font: UIFont.boldSystemFontOfSize(24.0))
    public let detailTextLabel = UILabel(title: "Subtitle", color: UIColor.whiteColor(), font: UIFont.boldSystemFontOfSize(12.0))

    override public init(frame: CGRect) {
        super.init(frame: frame)

        self.textLabel.textAlignment = .Left
        self.textLabel.setContentHuggingPriority(1000, forAxis: .Vertical)
        self.textLabel.setContentCompressionResistancePriority(1000, forAxis: .Horizontal)

        self.detailTextLabel.textAlignment = .Left
        self.detailTextLabel.setContentHuggingPriority(1000, forAxis: .Vertical)
        self.detailTextLabel.setContentCompressionResistancePriority(1000, forAxis: .Horizontal)

        let stack = UIStackView(axis: .Vertical)
        stack.addArrangedSubviews([self.textLabel, self.detailTextLabel])
        stack.preservesSuperviewLayoutMargins = true

        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleView = stack
        self.layoutIfNeeded()
        self.translatesAutoresizingMaskIntoConstraints = true
    }

    required public init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }

}

extension UIViewController {
    public var customTitleView: CustomTitleView? {
        return self.navigationItem.titleView as? CustomTitleView
    }
}


public class ControlBar: UIView {

    public var titleView = UIView() {
        didSet { self.update(titleView: self.titleView, oldValue: oldValue) }
    }

    public var leftViews = [UIView]() {
        didSet { self.update(leftViews: self.leftViews, oldValue: oldValue) }
    }

    public var rightViews = [UIView]() {
        didSet { self.update(rightViews: self.rightViews, oldValue: oldValue) }
    }


    private let stack = UIStackView(axis: .Horizontal)

    // MARK: Init

    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.layoutMargins = UIEdgeInsetsZero
        self.stack.preservesSuperviewLayoutMargins = true
        self.stack.layoutMarginsRelativeArrangement = true
        self.stack.addArrangedSubview(self.titleView)

        self.addView(self.stack)
        NSLayoutConstraint.activateConstraints([
            self.layoutMarginsGuide.leadingAnchor.constraintEqualToAnchor(stack.leadingAnchor),
            self.layoutMarginsGuide.trailingAnchor.constraintEqualToAnchor(stack.trailingAnchor),
            self.layoutMarginsGuide.topAnchor.constraintEqualToAnchor(stack.topAnchor),
            self.layoutMarginsGuide.bottomAnchor.constraintEqualToAnchor(stack.bottomAnchor)
        ])
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: Private methods

    private func update(leftViews views: [UIView], oldValue old: [UIView]) {
        self.stack.removeArrangedSubviews(old)
        old.forEach({ $0.removeFromSuperview() })
        views.reverse().forEach({ self.stack.insertArrangedSubview($0, atIndex: 0) })
    }

    private func update(rightViews views: [UIView], oldValue old: [UIView]) {
        self.stack.removeArrangedSubviews(old)
        old.forEach({ $0.removeFromSuperview() })
        self.stack.addArrangedSubviews(views)
    }

    private func update(titleView view: UIView, oldValue old: UIView) {
        if let index = self.stack.arrangedSubviews.indexOf(old) {
            self.stack.insertArrangedSubview(view, atIndex: index)
            self.stack.removeArrangedSubview(old)
            old.removeFromSuperview()
        }
    }

}
