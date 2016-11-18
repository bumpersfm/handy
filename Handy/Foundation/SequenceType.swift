//
// Created by Dani Postigo on 11/18/16.
//

import Foundation

extension SequenceType {
    public func take(find: (Self.Generator.Element) -> Bool) -> Self.Generator.Element? {
        var generator = self.generate()
        while let elem = generator.next() {
            if (find(elem)) {
                return elem
            }
        }
        return nil
    }
}