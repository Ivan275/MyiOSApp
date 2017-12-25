//
//  HomeController.swift
//  QiChat
//
//  Created by Qiqi He on 2017-12-24.
//  Copyright © 2017 Qiqi He. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class HomeController: UITabBarController {
	
	var gallery : GalleryController?
	var contact : ContactController?
	var setting : SettingController?
	
	var subViewController: [UIViewController] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
//		view.backgroundColor = .blue
		navigationItem.title = "Home"
		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "SignOut", style: .plain, target: self, action: #selector(handleSignOut))
		
		gallery = GalleryController()
		contact = ContactController()
		setting = SettingController()
		
		guard let gallery = gallery, let contact = contact, let setting = setting else {return}
		
		subViewController.append(gallery)
		subViewController.append(contact)
		subViewController.append(setting)
		
		gallery.tabBarItem = UITabBarItem(title: "Recent", image: #imageLiteral(resourceName: "recent"), selectedImage: #imageLiteral(resourceName: "recent"))
		contact.tabBarItem = UITabBarItem(title: "Contact", image: #imageLiteral(resourceName: "groups"), selectedImage: #imageLiteral(resourceName: "groups"))
		setting.tabBarItem = UITabBarItem(title: "Setting", image: #imageLiteral(resourceName: "setting"), selectedImage: #imageLiteral(resourceName: "setting"))
	
		gallery.tabBarItem.tag = 0
		contact.tabBarItem.tag = 1
		setting.tabBarItem.tag = 2

		self.setViewControllers(subViewController, animated: true)
		self.selectedIndex = 0
		self.selectedViewController = gallery
	}
	
	override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
		switch item.tag {
		case 0 :
			navigationItem.title = "Home"
		case 1 :
			navigationItem.title = "Recent"
		case 2 :
			navigationItem.title = "Setting"
		default:
			navigationItem.title = "Home"
		}
	}
	
	@objc func handleSignOut() {
		UserDefaults.standard.setLogin(value: false)
		FBSDKLoginManager().logOut()
		present(LoginViewController(), animated: true, completion: nil)
	}
}
