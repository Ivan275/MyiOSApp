//
//  ContactController.swift
//  QiChat
//
//  Created by Qiqi He on 2017-12-24.
//  Copyright © 2017 Qiqi He. All rights reserved.
//

import UIKit

class ContactController: UIViewController, UITableViewDataSource, UITableViewDelegate{

	let cellId = "cellId"
	let names : [String] = ["Ivan He", "Kevin Chan", "Adam D"]
	
//	var contacts : ContactModel?
	var contactsList : [ContactModel]?
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(tableView)
		tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
		tableView.register(ContactCell.self, forCellReuseIdentifier: cellId)
		tableView.delegate = self
		tableView.dataSource = self
		contactsList = ContactModel.setUpImage()
	}
	
	let tableView : UITableView = {
		let tv = UITableView()
		tv.rowHeight = 70
		return tv
	}()
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let count = contactsList?.count {
			
			return count
		}
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let row = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ContactCell
		row.contact = contactsList?[indexPath.item]
		return row
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let messageDetail = MessageDetailController()
		navigationController?.pushViewController(messageDetail, animated: true)
	}
	
}

class ContactCell: UITableViewCell {
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
//		backgroundColor = .blue
		addSubview(contactImage)
		addSubview(personName)
		addSubview(message)
		
		contactImage.translatesAutoresizingMaskIntoConstraints = false
		personName.translatesAutoresizingMaskIntoConstraints = false
		message.translatesAutoresizingMaskIntoConstraints = false
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-12-[v0(50)]-8-[v1]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": contactImage, "v1": personName]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(341)]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": message]))
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-15-[v0(50)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": contactImage]))
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-18-[v0(25)][v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": personName, "v1": message]))
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	var contact : ContactModel? {
		didSet{
			
			if let name = contact?.username, let imageName = contact?.imageName, let messageString = contact?.message {
				personName.text = name
				contactImage.image = UIImage(named: imageName)
				message.text = messageString
			}
			
		}
	}
	
	let contactImage: UIImageView = {
		let ci = UIImageView()
		ci.contentMode = .scaleAspectFill
		ci.clipsToBounds = true
		ci.layer.cornerRadius = 25
		ci.image = UIImage(named: "contact1")
		return ci
	}()
	
	let personName: UILabel = {
		let pn = UILabel()
		pn.text = "test"
		pn.lineBreakMode = .byCharWrapping
		pn.font = UIFont.boldSystemFont(ofSize: 20)
		return pn
	}()
	
	let message: UITextView = {
		let message = UITextView()
		message.isEditable = false
		message.isScrollEnabled = false
		message.text = "How is going so far? Talk you later."
		message.textColor = UIColor(white: 0.6, alpha: 1)
		return message
	}()
}

struct ContactModel {
	let id: Int
	let username: String
	let imageName: String
	let message: String
	
	static func setUpImage() -> [ContactModel] {
		let firstImage = ContactModel(id: 1, username: "Elephant", imageName: "contact1", message: "I love Amazon, Talk you later.")
		let secondImage = ContactModel(id: 2, username: "Monkey", imageName: "contact2", message: "How is going so far? I love Alibaba")
		let thirdImage = ContactModel(id: 3, username: "Peafowl", imageName: "contact3", message: "Are you free to talk, I have a new iPhone")
		let firthImage = ContactModel(id: 4, username: "Snake", imageName: "contact4", message: "Rocket, Rocket, It is my dream")
		let fifthImage = ContactModel(id: 5, username: "Penguin", imageName: "contact5", message: "I saw you today, buddy")
		return [firstImage, secondImage, thirdImage, firthImage, fifthImage]
	}
}

