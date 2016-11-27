//
// Created by Dani Postigo on 11/27/16.
//

import Foundation
import UIKit

public struct AnimationOptions {
    let duration: NSTimeInterval
    let delay: NSTimeInterval
    let options: UIViewAnimationOptions

    public init(duration: NSTimeInterval = 0.4, delay: NSTimeInterval = 0, options: UIViewAnimationOptions = UIViewAnimationOptions(rawValue: 0)) {
        self.duration = duration
        self.delay = delay
        self.options = options
    }
}

extension UIView {
    public class func animateWithOptions(options: AnimationOptions, animations: () -> Void, completion: ((Bool) -> Void)? = nil) {
        self.animateWithDuration(options.duration, delay: options.delay, options: options.options, animations: animations, completion: completion)
    }
}