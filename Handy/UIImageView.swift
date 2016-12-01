//
// Created by Dani Postigo on 11/18/16.
//

import Foundation
import UIKit

extension UIImageView {
    public convenience init(color: UIColor) {
        self.init(); self.backgroundColor = color
        self.opaque = false
    }
    
    public convenience init(image: UIImage?, contentMode: UIViewContentMode) {
        self.init(image: image); self.contentMode = contentMode
    }
}
