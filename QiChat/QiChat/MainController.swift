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
		view.backgroundColor = .red
		
		var isLogin = false
		
		if isLogin { //login
			
		} else { //not login
			perform(#selector(showLogin), with: nil, afterDelay: 0.01)
		}
	}
	
	@objc func showLogin() {
		present(ViewController(), animated: true, completion: {
			
		})
	}
}
