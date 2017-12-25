//
//  GallleryCell.swift
//  QiChat
//
//  Created by Qiqi He on 2017-12-24.
//  Copyright © 2017 Qiqi He. All rights reserved.
//

import UIKit

class GalleryCell: UICollectionViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
//		backgroundColor = .black
		
		addSubview(latestImageCollectionView)
		addSubview(separateLine)
		addSubview(titleName)
		
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": separateLine]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": titleName]))
	
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": latestImageCollectionView]))

		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[title(25)][v0][v1(0.5)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": latestImageCollectionView, "v1": separateLine, "title": titleName]))
//
//		latestImageCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive	= true
//		latestImageCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//		latestImageCollectionView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
//		latestImageCollectionView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive	= true

		latestImageCollectionView.register(TopImageCell.self, forCellWithReuseIdentifier: "topcell")
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	lazy var latestImageCollectionView : UICollectionView = {
		let layOut = UICollectionViewFlowLayout()
		layOut.scrollDirection = .horizontal
		let latestImage = UICollectionView(frame: .zero, collectionViewLayout: layOut)
		latestImage.dataSource = self
		latestImage.delegate = self
		latestImage.backgroundColor = .white
		latestImage.translatesAutoresizingMaskIntoConstraints = false
		return latestImage
	}()
	
	let separateLine : UIView = {
		let sl = UIView()
		sl.backgroundColor = UIColor(white: 0.8, alpha: 0.7)
		sl.translatesAutoresizingMaskIntoConstraints = false
		return sl
	}()
	
	let titleName : UILabel = {
		let name = UILabel()
		name.text = "Latest"
		name.font = UIFont.boldSystemFont(ofSize: 14)
		name.translatesAutoresizingMaskIntoConstraints = false
		return name
	}()
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 4
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topcell", for: indexPath) as! TopImageCell
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 100, height: frame.height)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
	}
	
	
}

class TopImageCell: UICollectionViewCell {
	override init(frame: CGRect) {
		super.init(frame: frame)
//		backgroundColor = .green
		addSubview(imageView)
		addSubview(imageName)
		addSubview(userName)
		addSubview(date)
		
		imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
		imageName.frame = CGRect(x: 0, y: frame.width + 2, width:  frame.width, height: 40)
		userName.frame = CGRect(x: 0, y: frame.width + 40, width:  frame.width, height: 20)
		date.frame = CGRect(x: 0, y: frame.width + 54, width:  frame.width, height: 20)
//		imageName.translatesAutoresizingMaskIntoConstraints = false
//
//		imageName.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	let imageView : UIImageView = {
		let iv = UIImageView()
		iv.image = UIImage(named:"card")
		iv.contentMode = .scaleAspectFill
		iv.layer.cornerRadius = 16
		iv.clipsToBounds = true
		return iv
	}()
	
	let imageName : UILabel = {
		let name = UILabel()
		name.text = "Art of Life and human of Life "
		name.font = UIFont.systemFont(ofSize: 12)
		name.numberOfLines = 2
		return name
	}()
	
	let userName : UILabel = {
		let name = UILabel()
		name.text = "Ivan He"
		name.font = UIFont.systemFont(ofSize: 12)
		name.numberOfLines = 2
		name.textColor = .gray
		return name
	}()
	
	let date : UILabel = {
		var mydate = UILabel()
		let date = NSDate() // Get Todays Date
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd-MM-yyyy"
		mydate.text = dateFormatter.string(from: date as Date)
		mydate.font = UIFont.systemFont(ofSize: 12)
		mydate.textColor = .gray
		return mydate
	}()
	
}



