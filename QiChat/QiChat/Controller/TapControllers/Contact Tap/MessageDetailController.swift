//
//  MessageDetailController.swift
//  QiChat
//
//  Created by Qiqi He on 2017-12-31.
//  Copyright © 2017 Qiqi He. All rights reserved.
//

import UIKit

class MessageDetailController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	private let cellId = "cellId"
	var loadMessage: MessageModel?
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		loadMessage = MessageModel.setUpMessage()
		
		view.addSubview(collectionView)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive	= true
		collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
		collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive	= true
		collectionView.register(MessageCell.self, forCellWithReuseIdentifier: cellId)
	}

	var selectedUser : ContactModel? {
		didSet{
			if let user = selectedUser?.username {
				navigationItem.title = user
			}
		}
	}
	
	lazy var collectionView : UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.backgroundColor = .white
		cv.dataSource = self
		cv.delegate = self
		return cv
	}()
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if let count = loadMessage?.message.count {
			return count
		}
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MessageCell
		cell.message.text = loadMessage?.message[indexPath.item].messageText
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		return CGSize(width: view.frame.width, height: 100)
	}
	
}

class MessageCell: UICollectionViewCell {
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(message)
		backgroundColor = .lightGray
		message.translatesAutoresizingMaskIntoConstraints = false
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": message]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": message]))
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	let message : UITextView = {
		let message = UITextView()
		message.text = "Hello World!"
		message.backgroundColor = UIColor.clear
		return message
	}()
	
}

struct MessageModel {
	let userName: String
	let message: [Message]
	
	static func setUpMessage() -> MessageModel {
		let firstMessage = Message( messageText: "Hello, How are you", messageDate: "2017-01-01")
		let secondMessage = Message( messageText: "right, That is so funny", messageDate: "2017-01-02")
		let thirdMessage = Message( messageText: "Rocket, Rocket, it is my dream", messageDate: "2017-01-03")
		
		let messages = MessageModel(userName: "Snack", message: [firstMessage,secondMessage,thirdMessage])
		return messages
	}
}


struct Message {
	let messageText: String
	let messageDate: String
}


