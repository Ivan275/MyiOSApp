//
//  MessageDetailController.swift
//  QiChat
//
//  Created by Qiqi He on 2017-12-31.
//  Copyright © 2017 Qiqi He. All rights reserved.
//

import UIKit

class MessageDetailController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
//		view.backgroundColor = .yellow
		view.addSubview(sampleImage)
		sampleImage.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
	}
	
	let sampleImage: UIImageView = {
		let si = UIImageView()
		si.image = UIImage(named: "messageDetail")
		return si
	}()
}
