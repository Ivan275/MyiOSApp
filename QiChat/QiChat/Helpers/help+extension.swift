//
//  help+extension.swift
//  QiChat
//
//  Created by Qiqi He on 2017-12-24.
//  Copyright © 2017 Qiqi He. All rights reserved.
//

import Foundation

extension UserDefaults {
	
	func setLogin(value: Bool) {
		set(value, forKey: "isLoggedIn")
		synchronize()
	}
	
	func getLogin() -> Bool {
		return bool(forKey: "isLoggedIn")
	}
}
