//
// Created by Dani Postigo on 11/24/16.
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
        self.textLabel.numberOfLines = 1
        
        self.detailTextLabel.textAlignment = .Left
        self.detailTextLabel.setContentHuggingPriority(1000, forAxis: .Vertical)
        self.detailTextLabel.setContentCompressionResistancePriority(1000, forAxis: .Horizontal)
        
        let stack = UIStackView(axis: .Vertical)
        stack.addArrangedSubviews([self.textLabel, self.detailTextLabel])
        stack.preservesSuperviewLayoutMargins = true
        stack.layoutMarginsRelativeArrangement = true
        
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
        let fittingSize = self.titleView.systemLayoutSizeFittingSize(target, withHorizontalFittingPriority: UILayoutPriorityRequired, verticalFittingPriority: UILayoutPriorityRequired)
        self.frame.size.width = fittingSize.width
    }
    
    public var title: String? {
        set { self.textLabel.text = newValue }
        get { return self.textLabel.text }
    }
    
    public var subtitle: String? {
        set { self.detailTextLabel.text = newValue }
        get { return self.detailTextLabel.text }
    }
}


extension UIView {
    
    func systemLayout() {
        let frame = self.frame
        
        let compressedSize = self.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
        Swift.print("compressedSize = \(compressedSize)")
        assert(self.frame == frame)
        
        let expandedSize = self.systemLayoutSizeFittingSize(UILayoutFittingExpandedSize)
        Swift.print("expandedSize = \(expandedSize)")
        assert(self.frame == frame)
    }
}