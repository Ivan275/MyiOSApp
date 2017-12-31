//
//  GalleryController.swift
//  QiChat
//
//  Created by Qiqi He on 2017-12-24.
//  Copyright © 2017 Qiqi He. All rights reserved.
//

import UIKit

class GalleryController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	let galleryId = "galleryId"
	let bigGalleryId = "bigGalleryId"
	
	var galleries : [GalleryCategory]?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(collectionView)
		
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
		collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
		collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true

		collectionView.register(GalleryCell.self, forCellWithReuseIdentifier: galleryId)
		collectionView.register(BigImageCell.self, forCellWithReuseIdentifier: bigGalleryId)
		galleries = GalleryCategory.setUpGallery()
	}
	
	lazy var collectionView : UICollectionView = {
		let layOut = UICollectionViewFlowLayout()
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layOut)
		cv.backgroundColor = .white
		cv.dataSource = self
		cv.delegate	= self
		return cv
	}()
	
	
	
	func selectedImageDetail(Image: ImageGallery) {
		let layout = UICollectionViewFlowLayout()
		let cv = DetailImageController(collectionViewLayout: layout)
		cv.Image = Image
		navigationController?.pushViewController(cv, animated: true)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if let counts = galleries?.count {
			return counts
		}
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if(indexPath.item == 1) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bigGalleryId, for: indexPath) as! BigImageCell
			cell.category = galleries?[indexPath.item]
			cell.gallery = self
			return cell
		}
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: galleryId, for: indexPath) as! GalleryCell
		cell.category = galleries?[indexPath.item]
		cell.gallery = self
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		if(indexPath.item == 1) {
			return CGSize(width: view.frame.width, height: 230)
		}
		return CGSize(width: view.frame.width, height: 200)
	}
	
}

class BigImageCell: GalleryCell {
	
	override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 120, height: frame.height)
	}
}

