// The MIT License (MIT)
// Copyright © 2019 Ivan Varabei (varabeis@icloud.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

/**
 Base class with fast presenting.
 */
public enum SPAlert {
    
    /**
     Present with presets.
     
     - parameter title: Main text in alert.
     - parameter message: Subtitle in alert. Optional.
     - parameter preset: Сonfigureв preset with layout and icons.
     */
	@discardableResult
    public static func present(title: String, message: String? = nil, preset: SPAlertPreset) -> SPAlertView {
        let alertView = SPAlertView(title: title, message: message, preset: preset)
        alertView.present()

		return alertView
    }
    
    /**
     Present with image.
     
     - parameter title: Main text in alert.
     - parameter message: Subtitle in alert. Optional.
     - parameter image: Custom `UIImage` for alert. No need recize it before.
     */
	@discardableResult
    public static func present(title: String, message: String? = nil, image: UIImage) -> SPAlertView {
        let alertView = SPAlertView(title: title, message: message, image: image)
        alertView.present()

		return alertView
    }
    
    /**
     Present only message, without icon.
     
     - parameter haptic: Pass with vibro using with present alet.
     */
	@discardableResult
    public static func present(message: String, haptic: SPAlertHaptic = .none) -> SPAlertView {
        let alertView = SPAlertView(message: message)
        alertView.haptic = haptic
        alertView.present()

		return alertView
    }

	@discardableResult
	public static func presentLoading(message: String, timeout: Double? = nil) -> SPAlertView {
		let alertView = SPAlertView(loadingMessage: message)
		alertView.width = 125
		alertView.dismissByTap = false
		alertView.duration = timeout
		alertView.disableUserInteractionWhenPresenting = true
		alertView.present()

		return alertView
	}
}
