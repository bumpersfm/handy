//
// Created by Dani Postigo on 11/23/16.
//

import Foundation

extension NSUserDefaults {

    public func setBool<T: RawRepresentable where T.RawValue == String>(value: Bool, forKey type: T) {
        self.setBool(value, forKey: type.rawValue)
    }

    public func setObject<T: RawRepresentable where T.RawValue == String>(value: AnyObject?, forKey type: T) {
        self.setObject(value, forKey: type.rawValue)
    }

    public func boolForKey<T: RawRepresentable where T.RawValue == String>(type: T) -> Bool {
        return self.boolForKey(type.rawValue)
    }

    public func objectForKey<T: RawRepresentable where T.RawValue == String>(type: T) -> AnyObject? {
        return self.objectForKey(type.rawValue)
    }
}

