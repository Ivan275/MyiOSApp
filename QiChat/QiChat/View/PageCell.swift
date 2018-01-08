//
//  PageCell.swift
//  QiChat
//
//  Created by Qiqi He on 2017-12-20.
//  Copyright © 2017 Qiqi He. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {

	var page: PageModel? {
		didSet {
			guard let page = page else {return}
			var imageName = page.imageName
			if(UIDevice.current.orientation.isLandscape) {
				imageName = imageName + "_landscape"
			}
			
			imageView.image = UIImage(named: imageName)
			let attributeString = NSMutableAttributedString(string: page.title, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium), NSAttributedStringKey.foregroundColor: UIColor(white: 0.2, alpha: 1)])
//			textArea.text = page.title + "\n\n" + page.description
			attributeString.append(NSAttributedString(string: "\n\n \(page.description)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor(white: 0.2, alpha: 1)]))
			let paragraphStyle = NSMutableParagraphStyle()
			paragraphStyle.alignment = .center
			let length = attributeString.string.count
			attributeString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
			textArea.attributedText = attributeString
			
		}
	}

	
	let imageView : UIImageView = {
		let iv = UIImageView()
		iv.image = UIImage(named: "home")
		iv.clipsToBounds = true
		iv.contentMode = .scaleAspectFit
		return iv
	}()
	
	let textArea : UITextView = {
		let area = UITextView()
//		area.font = UIfont(.boldSystemFont(ofSize: 16))
		area.text = "sample text"
		area.isEditable = false
		area.backgroundColor = .white
		area.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
		return area
	}()
	
	let horizontalLine : UIView = {
		let view = UIView()
		view.backgroundColor = UIColor(white: 0.9, alpha: 1)
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setUpImage()

	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setUpImage() {
		
		addSubview(imageView)
		addSubview(textArea)

		addSubview(horizontalLine)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
		imageView.bottomAnchor.constraint(equalTo: textArea.topAnchor).isActive = true
		imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
		
		textArea.translatesAutoresizingMaskIntoConstraints = false
		textArea.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
		textArea.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
		textArea.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
		textArea.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
		
		horizontalLine.translatesAutoresizingMaskIntoConstraints = false
		horizontalLine.bottomAnchor.constraint(equalTo: textArea.topAnchor).isActive = true
		horizontalLine.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		horizontalLine.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
		horizontalLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
		
		
		
	}
}
