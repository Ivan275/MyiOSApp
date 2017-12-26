//
//  LoginCell.swift
//  QiChat
//
//  Created by Qiqi He on 2017-12-23.
//  Copyright © 2017 Qiqi He. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class loginCell: UICollectionViewCell,FBSDKLoginButtonDelegate {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(logoImage)
		addSubview(emailField)
		addSubview(passwordField)
		addSubview(loginButton)
		
		logoImage.translatesAutoresizingMaskIntoConstraints = false
		emailField.translatesAutoresizingMaskIntoConstraints = false
		passwordField.translatesAutoresizingMaskIntoConstraints	= false
		loginButton.translatesAutoresizingMaskIntoConstraints = false
		
		logoImage.topAnchor.constraint(equalTo: centerYAnchor, constant: -200).isActive = true
		logoImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive	= true
		logoImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
		logoImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
		
		emailField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 30).isActive = true
		emailField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive	= true
		emailField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
		emailField.heightAnchor.constraint(equalToConstant: 50).isActive = true
		
		passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 15).isActive = true
		passwordField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive	= true
		passwordField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
		passwordField.heightAnchor.constraint(equalToConstant: 50).isActive = true
		
		loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 15).isActive = true
		loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive	= true
		loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
		loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
		
		let fbloginButton = FBSDKLoginButton()
		addSubview(fbloginButton)
		fbloginButton.translatesAutoresizingMaskIntoConstraints = false
		fbloginButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15).isActive = true
		fbloginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive	= true
		fbloginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
		fbloginButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
		
		fbloginButton.delegate = self
//		fbloginButton.readPermissions = ["email", "public_profile"]
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	let logoImage : UIImageView = {
		let iv = UIImageView()
		iv.image = UIImage(named: "homelogo")
		return iv
	}()
	
	let emailField : textField = {
		let email = textField()
		email.placeholder = "Email"
		email.layer.borderWidth = 1
		email.layer.borderColor = UIColor(white: 0.9, alpha: 1).cgColor
		return email
	}()
	
	let passwordField : textField = {
		let password = textField()
		password.placeholder = "Password"
		password.isSecureTextEntry = true
		password.layer.borderWidth = 1
		password.layer.borderColor = UIColor(white: 0.9, alpha: 1).cgColor
		return password
	}()
	
	lazy var loginButton : UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("Log in", for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.backgroundColor = .orange
		button.addTarget(self, action: #selector(clickLogin), for: .touchUpInside)
		return button
	}()
	
	weak var delegate : loginControllerDelegate?
	@objc func clickLogin() {
		delegate?.finishLogin()
	}
	
	func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
		print("did log out of facebook")
	}
	
	func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
		if error != nil {
			print(error)
			return
		}
		delegate?.finishLogin()
		print("login successfully")
	}
	

}



class textField: UITextField {
	override func textRect(forBounds bounds: CGRect) -> CGRect {
		return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width, height: bounds.height)
	}
	
	override func editingRect(forBounds bounds: CGRect) -> CGRect {
		return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width, height: bounds.height)
	}
}






