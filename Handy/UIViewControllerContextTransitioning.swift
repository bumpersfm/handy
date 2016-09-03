//
//  UIViewControllerAnimatedTransitioning.swift
//  Pods
//
//  Created by Dani Postigo on 8/31/16.
//
//

import Foundation


extension UIViewControllerContextTransitioning {
    
    public var toView: UIView? {
        return self.viewForKey(UITransitionContextToViewKey)
    }
    public var toViewController: UIViewController? {
        return self.viewControllerForKey(UITransitionContextToViewControllerKey)
    }
    
    public var toInitialFrame: CGRect {
        return self.initialFrameForViewController(self.toViewController!)
    }
    
    public var toFinalFrame: CGRect {
        return self.finalFrameForViewController(self.toViewController!)
    }
    
    public var fromView: UIView? {
        return self.viewForKey(UITransitionContextFromViewKey)
    }
    
    public var fromViewController: UIViewController? {
        return self.viewControllerForKey(UITransitionContextFromViewControllerKey)
    }
    
    public var fromInitialFrame: CGRect {
        return self.initialFrameForViewController(self.fromViewController!)
    }
    
    public var fromFinalFrame: CGRect {
        return self.finalFrameForViewController(self.fromViewController!)
    }
}
