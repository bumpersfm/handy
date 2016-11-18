//
// Created by Dani Postigo on 11/9/16.
//

import Foundation

extension UIApplication {
	public func sendSMS(number number: String, message body: String = "") {
		guard let sms = "sms:+\(number)&body=\(body)".stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet()) else { return }
		UIApplication.sharedApplication().openURL(NSURL(string: sms)!)
	}
}
