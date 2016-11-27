//
// Created by Dani Postigo on 11/24/16.
//

import Foundation
import UIKit

public typealias JSON = [String: AnyObject]
public typealias Block = Void -> Void
public typealias Completion = Void -> Void
public typealias Failure = NSError -> Void


public let App = UIApplication.sharedApplication()