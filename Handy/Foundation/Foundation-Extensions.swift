//
// Created by Dani Postigo on 9/28/16.
// Copyright (c) 2016 TokBox. All rights reserved.
//

import Foundation

extension NSFileManager {
    public var documentsDirectory: NSURL? {
        return self.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first
    }
}
