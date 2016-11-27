//
// Created by Dani Postigo on 11/24/16.
//

import Foundation
import UIKit

public class WindowManager: NSObject {

    public static let shared = WindowManager()

    private var windows = [UIWindow]()

    public func show(window: UIWindow) {
        self.windows.append(window)
        window.hidden = false
    }

    public func makeKeyAndVisible(window window: UIWindow) {
        self.windows.append(window)
        window.makeKeyAndVisible()
    }

    public func remove(window window: UIWindow) {
        window.hidden = true
        guard let index = self.windows.indexOf(window) else { return }
        self.windows.removeAtIndex(index)
    }
}
