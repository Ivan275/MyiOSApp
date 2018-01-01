//
//  DetailScrollImageCell.swift
//  QiChat
//
//  Created by Qiqi He on 2017-12-30.
//  Copyright © 2017 Qiqi He. All rights reserved.
//

import UIKit

class DetailScrollImageCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .white
		addSubview(colletionView)
		colletionView.translatesAutoresizingMaskIntoConstraints	= false
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-12-[v0]-12-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":colletionView]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-12-[v0]-12-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":colletionView]))
		colletionView.register(ScrollableImageCell.self, forCellWithReuseIdentifier: cellId)
		
		scrollImageGallery = GalleryCategory.setUpScrollGallery()
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private let cellId = "cellId"
	
	lazy var colletionView : UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.dataSource = self
		cv.delegate = self
		cv.backgroundColor = UIColor(white: 0.9, alpha: 1)
		return cv
	}()
	
	var scrollImageGallery : [ImageGallery]?
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if let count = scrollImageGallery?.count {
			return count
		}
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScrollableImageCell
		cell.scrollGallery = scrollImageGallery![indexPath.item]
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: frame.height, height: 200)
	}
}

class ScrollableImageCell: UICollectionViewCell {
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubview(scrollImage)
		scrollImage.translatesAutoresizingMaskIntoConstraints = false
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":scrollImage]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":scrollImage]))
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	var scrollGallery: ImageGallery? {
		didSet{
			if let name = scrollGallery?.imageName {
				scrollImage.image = UIImage(named: name)
			}
			
		}
	}
	
	let scrollImage: UIImageView = {
		let si = UIImageView()
		si.image = UIImage(named: "p1")
		si.contentMode = .scaleAspectFit
		si.clipsToBounds = true
		return si
	}()
}

class DescriptionCell: UICollectionViewCell {
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(textView)
		addSubview(userImage)
		addSubview(lineView)
		addSubview(segmentedControl)
		addSubview(descriptionView)
		textView.translatesAutoresizingMaskIntoConstraints = false
		userImage.translatesAutoresizingMaskIntoConstraints	= false
		lineView.translatesAutoresizingMaskIntoConstraints = false
		segmentedControl.translatesAutoresizingMaskIntoConstraints = false
		descriptionView.translatesAutoresizingMaskIntoConstraints = false
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":lineView]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v1(100)]-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":textView, "v1": userImage]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-60-[v0]-60-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":segmentedControl]))
//		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":descriptionView]))
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1(1)]-8-[v0(100)]-8-[v2(30)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":userImage, "v1": lineView, "v2": segmentedControl]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-60-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":textView]))
		
		descriptionView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8).isActive = true
		descriptionView.heightAnchor.constraint(equalToConstant: 130).isActive = true
		descriptionView.widthAnchor.constraint(equalTo: widthAnchor, constant: 8).isActive = true
		
//		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-200-[v0(50)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": descriptionView]))
	
//		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(30)]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":segmentedControl]))
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	let textView: UITextView = {
		let tv = UITextView()
		tv.isEditable = false
		let textName = "Name: John Wu-Tzanq Liaw"
		let description = "Years of Exprience: 30"
		tv.text = textName + "\n" + description
		tv.font	= UIFont.boldSystemFont(ofSize: 18)
		
		return tv
	}()

	
	let userImage: UIImageView = {
		let ui = UIImageView()
		ui.contentMode = .scaleAspectFit
		ui.clipsToBounds = true
		ui.layer.cornerRadius = 16
		ui.image = UIImage(named: "user_image")
		return ui
	}()

	let lineView: UIView = {
		let lv = UIView()
		lv.backgroundColor = UIColor(white:0.4, alpha: 0.4)
		return lv
	}()
	
	let segmentedControl: UISegmentedControl = {
		let sc = UISegmentedControl(items: ["Description", "Time Line"])
		sc.tintColor = UIColor(white: 0.5, alpha: 1)
		sc.selectedSegmentIndex = 0
		return sc
	}()
	
	let descriptionView: UITextView = {
		let dv = UITextView()
		dv.text = "Taiwanese-Canadian artist Wu-Tzanq Liaw holds a Bachelor of Fine Arts degree at the National Taiwan Normal University in Taiwan, and a Master of Arts degree in Industrial Design at the Tokyo University of Education in Japan."
		return dv
	}()
	
	
}
