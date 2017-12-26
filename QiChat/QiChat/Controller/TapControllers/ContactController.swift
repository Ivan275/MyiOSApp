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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(tableView)
		tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
		tableView.delegate = self
		tableView.dataSource = self
		
	}
	
	let tableView : UITableView = {
		let tv = UITableView()
		return tv
	}()
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return names.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var row = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
 		row.textLabel?.text = names[indexPath.row]
		return row
	}
	
}

