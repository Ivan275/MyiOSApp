//
//  DetailImageController.swift
//  QiChat
//
//  Created by Qiqi He on 2017-12-30.
//  Copyright © 2017 Qiqi He. All rights reserved.
//

import UIKit

class DetailImageController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
	
	var Image: ImageGallery? {
		didSet{
			if let title = Image?.titleName {
				navigationItem.title = title
			}
			
		}
	}
	
	private let cellId = "cellId"
	private let scrollCellId = "scrollId"
	private let descriptionId = "descriptionId"
	override func viewDidLoad() {
		super.viewDidLoad()
		collectionView?.alwaysBounceVertical = true
		collectionView?.backgroundColor = .white
		collectionView?.register(DetailImageCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: cellId)
		collectionView?.register(DetailScrollImageCell.self, forCellWithReuseIdentifier: scrollCellId)
		collectionView?.register(DescriptionCell.self, forCellWithReuseIdentifier: descriptionId)
	}
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 2
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if(indexPath.item == 1) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: descriptionId, for: indexPath)as! DescriptionCell
			return cell
		}
		return collectionView.dequeueReusableCell(withReuseIdentifier: scrollCellId, for: indexPath) as! DetailScrollImageCell
	}
	
	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: cellId, for: indexPath) as! DetailImageCell
		cell.Image = Image
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		return CGSize(width: view.frame.width, height: 200)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: view.frame.width, height: 200)
	}
}

class DetailImageCell: UICollectionViewCell {
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(selectedImage)
		backgroundColor = .black
		selectedImage.translatesAutoresizingMaskIntoConstraints	= false
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": selectedImage]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": selectedImage]))
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	var Image: ImageGallery? {
		didSet{
			if let ImageName = Image?.imageName {
				selectedImage.image = UIImage(named: ImageName)
			}
			
		}
	}
	
	let selectedImage: UIImageView = {
		let si = UIImageView()
		si.contentMode = .scaleAspectFit
		si.clipsToBounds = true
		return si
	}()
}
