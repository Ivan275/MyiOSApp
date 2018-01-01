//
//  UploadController.swift
//  QiChat
//
//  Created by Qiqi He on 2017-12-31.
//  Copyright © 2017 Qiqi He. All rights reserved.
//

import UIKit

class UploadController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
	private let cellId = "cellId"
	var gallery : [ImageGallery]?
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(collectionView)
//		collectionView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)

		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		collectionView.register(UploadCell.self, forCellWithReuseIdentifier: cellId)
		gallery = GalleryCategory.setUpScrollGallery()
		
	}

	lazy var collectionView : UICollectionView = {
		let layOut = UICollectionViewFlowLayout()
		layOut.minimumLineSpacing = 8
//		layOut.scrollDirection = .horizontal
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layOut)
		cv.backgroundColor = .white
		cv.dataSource = self
		cv.delegate	= self
		return cv
	}()
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if let count = gallery?.count {
			return count
		}
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! UploadCell
		cell.images.image = UIImage(named: (gallery?[indexPath.item].imageName)!) 
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 125, height: 150)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsetsMake(8, 8, 8, 8)
	}
}

class UploadCell: UICollectionViewCell {
	override init(frame: CGRect) {
		super.init(frame: frame)
//		backgroundColor = .blue
		addSubview(images)
		images.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
//	var uploadImages : ImageGallery? {
//		didSet{
//			images.image
//		}
//	}
	
	let images : UIImageView = {
		let images = UIImageView()
		images.contentMode = .scaleToFill
		images.image = UIImage(named: "p1")
		return images
	}()
}
