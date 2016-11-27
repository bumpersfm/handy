//
// Created by Dani Postigo on 11/27/16.
//

import Foundation

extension NSFileManager {
    public var documentsDirectory: NSURL? {
        return self.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first
    }
}
