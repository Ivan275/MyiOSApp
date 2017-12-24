//
//  MainController.swift
//  QiChat
//
//  Created by Qiqi He on 2017-12-23.
//  Copyright © 2017 Qiqi He. All rights reserved.
//

import UIKit

class MainController: UINavigationController {
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		
//		let isLogin = false
		
		
		if isLogin() { //login
			let home = HomeController()
			viewControllers = [home]
		
		} else { //not login
			perform(#selector(showLogin), with: nil, afterDelay: 0.001)

		}
	}
	
	@objc func showLogin() {
		present(LoginViewController(), animated: true, completion: {
		})
	}
	
	func isLogin() -> Bool {
		return UserDefaults.standard.getLogin()
	}
}


