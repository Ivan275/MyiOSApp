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
		
		let topImage1 = ImageGallery(id: 1, imageName: "p1", titleName: "The Most Greatest Artwork 1", authorName: "John Wu-Tzanq Liawe", dateString: "2010-1-1")
		let topImage2 = ImageGallery(id: 2, imageName: "p2", titleName: "The Most Greatest Artwork 2", authorName: "John Wu-Tzanq Liaw", dateString: "2011-1-1")
		let topImage3 = ImageGallery(id: 3, imageName: "p3", titleName: "The Most Greatest Artwork 3", authorName: "John Wu-Tzanq Liaw", dateString: "2012-2-1")
		let topImage4 = ImageGallery(id: 4, imageName: "p4", titleName: "The Most Greatest Artwork 4", authorName: "John Wu-Tzanq Liaw", dateString: "2013-3-1")
		let topImage5 = ImageGallery(id: 5, imageName: "p5", titleName: "The Most Greatest Artwork 5", authorName: "John Wu-Tzanq Liaw", dateString: "2014-4-1")
		let topImage6 = ImageGallery(id: 6, imageName: "p6", titleName: "The Most Greatest Artwork 6", authorName: "John Wu-Tzanq Liaw", dateString: "2015-5-1")
		let topImage7 = ImageGallery(id: 7, imageName: "p7", titleName: "The Most Greatest Artwork 7", authorName: "John Wu-Tzanq Liaw", dateString: "2016-6-1")
		let topImage8 = ImageGallery(id: 8, imageName: "p8", titleName: "The Most Greatest Artwork 8", authorName: "John Wu-Tzanq Liaw", dateString: "2017-7-1")
		let topImages = GalleryCategory(categoryName: "Top Images", gallery: [topImage1,topImage2,topImage3,topImage4,topImage5,topImage6,topImage7,topImage8])
		
		let latestImage1 = ImageGallery(id: 5, imageName: "p5", titleName: "The Most Greatest Artwork 5", authorName: "John Wu-Tzanq Liawe", dateString: "2014-4-1")
		let latestImage2 = ImageGallery(id: 6, imageName: "p6", titleName: "The Most Greatest Artwork 6", authorName: "John Wu-Tzanq Liaw", dateString: "2015-5-1")
		let latestImage3 = ImageGallery(id: 7, imageName: "p7", titleName: "The Most Greatest Artwork 7", authorName: "John Wu-Tzanq Liaw", dateString: "2016-6-1")
		let latestImage4 = ImageGallery(id: 8, imageName: "p8", titleName: "The Most Greatest Artwork 8", authorName: "John Wu-Tzanq Liaw", dateString: "2017-7-1")
		let latestImages = GalleryCategory(categoryName: "Latest Images", gallery: [latestImage1, latestImage2, latestImage3, latestImage4])
		
		let MostLikesImage1 = ImageGallery(id: 5, imageName: "p5", titleName: "The Most Greatest Artwork 5", authorName: "John Wu-Tzanq Liaw", dateString: "2014-4-1")
		let MostLikesImage2 = ImageGallery(id: 6, imageName: "p6", titleName: "The Most Greatest Artwork 6", authorName: "John Wu-Tzanq Liaw", dateString: "2015-5-1")
		let MostLikesImage3 = ImageGallery(id: 7, imageName: "p7", titleName: "The Most Greatest Artwork 7", authorName: "John Wu-Tzanq Liaw", dateString: "2016-6-1")
		let MostLikesImage4 = ImageGallery(id: 8, imageName: "p8", titleName: "The Most Greatest Artwork 8", authorName: "John Wu-Tzanq Liaw", dateString: "2017-7-1")
		let MostLikesImage5 = ImageGallery(id: 9, imageName: "p9", titleName: "The Most Greatest Artwork 9", authorName: "John Wu-Tzanq Liaw", dateString: "2018-8-1")
		let MostLikesImage6 = ImageGallery(id: 10, imageName: "p10", titleName: "The Most Greatest Artwork 10", authorName: "John Wu-Tzanq Liaw", dateString: "2019-9-1")
		let MostLikesImages = GalleryCategory(categoryName: "Most Likes Images", gallery: [MostLikesImage1, MostLikesImage2, MostLikesImage3, MostLikesImage4,MostLikesImage5, MostLikesImage6])
		
		return [topImages,latestImages,MostLikesImages]
	}
}

struct ImageGallery {
	let id : Int
	let imageName: String
	let titleName: String
	let authorName: String
	let dateString: String
}
