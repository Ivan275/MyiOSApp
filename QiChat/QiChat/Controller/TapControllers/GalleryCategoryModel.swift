//
//  GalleryCategory.swift
//  QiChat
//
//  Created by Qiqi He on 2017-12-25.
//  Copyright © 2017 Qiqi He. All rights reserved.
//

import Foundation

struct GalleryCategory {
	let categoryName : String
	let gallery : [ImageGallery]
	
	
	static func setUpGallery() -> [GalleryCategory] {
		let gallery = ImageGallery(id: 1, imageName: "top1", titleName: "this is top1 ", authorName: "Ivan He", dateString: "2017-12-22")
		let gallery1 = ImageGallery(id: 1, imageName: "top1", titleName: "this is top1.1 ", authorName: "Ivan He", dateString: "2017-2-2")
		let myCategory = GalleryCategory(categoryName: "Top Images", gallery: [gallery,gallery1])
		
		let gallery2 = ImageGallery(id: 2, imageName: "top2", titleName: "this is top2 ", authorName: "Kevin He", dateString: "2017-12-43")
		let myCategory2 = GalleryCategory(categoryName: "latest Images", gallery: [gallery2])
		return [myCategory,myCategory2]
	}
}

struct ImageGallery {
	let id : Int
	let imageName: String
	let titleName: String
	let authorName: String
	let dateString: String
}
