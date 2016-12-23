//
// Created by Dani Postigo on 11/24/16.
//

import Foundation
import UIKit

open class CustomTitleView: ControlBar {
    
    open let textLabel = UILabel(title: "Title", font: UIFont.boldSystemFont(ofSize: 24.0), color: UIColor.white)
    open let detailTextLabel = UILabel(title: "Subtitle", font: UIFont.boldSystemFont(ofSize: 12.0), color: UIColor.white)
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        self.textLabel.textAlignment = .left
        self.textLabel.setContentHuggingPriority(1000, for: .vertical)
        self.textLabel.setContentCompressionResistancePriority(1000, for: .horizontal)
        self.textLabel.numberOfLines = 1
        
        self.detailTextLabel.textAlignment = .left
        self.detailTextLabel.setContentHuggingPriority(1000, for: .vertical)
        self.detailTextLabel.setContentCompressionResistancePriority(1000, for: .horizontal)
        
        let stack = UIStackView(axis: .vertical)
        stack.addArrangedSubviews([self.textLabel, self.detailTextLabel])
        stack.preservesSuperviewLayoutMargins = true
        stack.isLayoutMarginsRelativeArrangement = true
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleView = stack
        self.layoutIfNeeded()
        self.translatesAutoresizingMaskIntoConstraints = true
        
    }
    
    required public init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    
    // MARK: Convenience
    
    public convenience init(title: String, subtitle: String = "Subtitle") {
        self.init(); self.title = title; self.subtitle = subtitle
    }
    
    public convenience init(navigationItem: UINavigationItem) {
        self.init(title: navigationItem.title ?? "")
    }
    
    public convenience init(forViewController vc: UIViewController) {
        self.init(navigationItem: vc.navigationItem)
        let estimatedItemWidth: CGFloat = 50
        let target = CGSize(width: vc.view.frame.size.width - (estimatedItemWidth * 2), height: self.titleView.frame.size.height)
        self.textLabel.preferredMaxLayoutWidth = target.width
        let fittingSize = self.titleView.systemLayoutSizeFitting(target, withHorizontalFittingPriority: UILayoutPriorityRequired, verticalFittingPriority: UILayoutPriorityRequired)
        self.frame.size.width = fittingSize.width
    }
    
    open var title: String? {
        set { self.textLabel.text = newValue }
        get { return self.textLabel.text }
    }
    
    open var subtitle: String? {
        set { self.detailTextLabel.text = newValue }
        get { return self.detailTextLabel.text }
    }
}


extension UIView {
    
    func systemLayout() {
        let frame = self.frame
        
        let compressedSize = self.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        Swift.print("compressedSize = \(compressedSize)")
        assert(self.frame == frame)
        
        let expandedSize = self.systemLayoutSizeFitting(UILayoutFittingExpandedSize)
        Swift.print("expandedSize = \(expandedSize)")
        assert(self.frame == frame)
    }
}
