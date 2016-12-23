//
// Created by Dani Postigo on 11/24/16.
//

import Foundation
import UIKit

open class WindowManager: NSObject {

    open static let shared = WindowManager()

    fileprivate var windows = [UIWindow]()

    open func show(_ window: UIWindow) {
        self.windows.append(window)
        window.isHidden = false
    }

    open func makeKeyAndVisible(window: UIWindow) {
        self.windows.append(window)
        window.makeKeyAndVisible()
    }

    open func remove(window: UIWindow) {
        window.isHidden = true
        guard let index = self.windows.index(of: window) else { return }
        self.windows.remove(at: index)
    }
}
