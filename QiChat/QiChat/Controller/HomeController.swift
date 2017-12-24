//
//  HomeController.swift
//  QiChat
//
//  Created by Qiqi He on 2017-12-24.
//  Copyright © 2017 Qiqi He. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class HomeController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		navigationItem.title = "Home"
		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "SignOut", style: .plain, target: self, action: #selector(handleSignOut))
	}
	
	@objc func handleSignOut() {
		UserDefaults.standard.setLogin(value: false)
		FBSDKLoginManager().logOut()
		present(LoginViewController(), animated: true, completion: nil)
	}
}
