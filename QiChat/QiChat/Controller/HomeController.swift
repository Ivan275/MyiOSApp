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
	var upload  : UploadController?
	var setting : SettingController?
	
	var subViewController: [UIViewController] = []
	var user : String?
	override func viewDidLoad() {
		super.viewDidLoad()
//		view.backgroundColor = .blue
		navigationItem.title = "Home"
		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "SignOut", style: .plain, target: self, action: #selector(handleSignOut))
		
		gallery = GalleryController()
		contact = ContactController()
		setting = SettingController()
		upload  = UploadController()
		
		guard let gallery = gallery, let contact = contact, let setting = setting, let upload = upload  else {return}
		
		subViewController.append(gallery)
		subViewController.append(contact)
		subViewController.append(upload)
		subViewController.append(setting)
		
		gallery.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "recent"), selectedImage: #imageLiteral(resourceName: "recent"))
		contact.tabBarItem = UITabBarItem(title: "Contact", image: #imageLiteral(resourceName: "groups"), selectedImage: #imageLiteral(resourceName: "groups"))
		upload.tabBarItem = UITabBarItem(title: "Upload", image: #imageLiteral(resourceName: "upload"), selectedImage: #imageLiteral(resourceName: "upload"))
		setting.tabBarItem = UITabBarItem(title: "Setting", image: #imageLiteral(resourceName: "setting"), selectedImage: #imageLiteral(resourceName: "setting"))
	
		gallery.tabBarItem.tag = 0
		contact.tabBarItem.tag = 1
		upload.tabBarItem.tag  = 2
		setting.tabBarItem.tag = 3

		self.setViewControllers(subViewController, animated: true)
		self.selectedIndex = 0
		self.selectedViewController = gallery
		
		getFacebookInfo { (userName) in
			self.user = userName
//			self.navigationItem.leftBarButtonItem?.title = userName
			UserDefaults.standard.set(userName, forKey: "UserName")
			
		}
		setup()
	}
	func setup() {
		guard let user = UserDefaults.standard.string(forKey: "UserName") else {
			return
		}
		navigationItem.rightBarButtonItem =  UIBarButtonItem(title: user, style: .plain, target: self, action: #selector(userInfo))
		
	}

	@objc func userInfo() {
		print("this is user info")
	}
	
	override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
		switch item.tag {
		case 0 :
			navigationItem.title = "Home"
		case 1 :
			navigationItem.title = "Contact"
		case 2 :
			navigationItem.title = "Upload"
		case 3 :
			navigationItem.title = "Setting"
		default:
			navigationItem.title = "Home"
		}
	}
	
	
	
	func getFacebookInfo(completion:@escaping ( _ result: String) -> ()) {
		
		FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start { (connection, result, err) in
			if err != nil {
				print("Failed to get data")
			}
			
			guard let res = result as? NSDictionary else { return }
			if let name = res["name"] as? String{
				
					completion(name)
				
				
			}
			
		}
//		print(userName)
		
	}
	
	@objc func handleSignOut() {
		UserDefaults.standard.setLogin(value: false)
		FBSDKLoginManager().logOut()
		present(LoginViewController(), animated: true, completion: nil)
	}
}
