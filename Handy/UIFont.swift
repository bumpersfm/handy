//
// Created by Dani Postigo on 11/28/16.
//

import Foundation
import UIKit

extension UIFont {
    
    public static func listAll() {
        let fontFamilyNames = UIFont.familyNames()
        for familyName in fontFamilyNames {
            print("------------------------------")
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNamesForFamilyName(familyName as! String)
            print("Font Names = [\(names)]")
        }
    }
    
}
