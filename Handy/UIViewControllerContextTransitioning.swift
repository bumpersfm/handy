//
//  UIViewControllerAnimatedTransitioning.swift
//  Pods
//
//  Created by Dani Postigo on 8/31/16.
//
//

import Foundation
import UIKit

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


extension UIViewControllerAnimatedTransitioning {
    public func transitionWithContext(context: UIViewControllerContextTransitioning, options: UIViewAnimationOptions = .TransitionCrossDissolve) {
        context.containerView().addSubview(context.fromView!)
        UIView.transitionFromView(context.fromView!, toView: context.toView!, duration: self.transitionDuration(context), options: options, completion: { _ in context.completeTransition(true) })
    }
}

