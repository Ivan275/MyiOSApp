//
//  ViewController.swift
//  QiChat
//
//  Created by Qiqi He on 2017-12-20.
//  Copyright © 2017 Qiqi He. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
	
	let cellId = "cellId"
	
	lazy var collectionView : UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.minimumLineSpacing = 0
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.backgroundColor = .white
		cv.dataSource = self
		cv.delegate	= self
		cv.isPagingEnabled = true
		return cv
	}()
	
	let pages : [PageModel] = {
		let firstPage = PageModel(imageName: "home", title: "This is title1", description: "this is my description, hello world1his is my description, hello world1his is my description, hello world1")
		let secondPage = PageModel(imageName: "home2", title: "This is title2", description: "this is my description, hello world2his is my description, hello world1his is my description, hello world1his is my description, hello world1")
		let thirdPage = PageModel(imageName: "home3", title: "This is title3", description: "this is my description, hello world3his is my description, hello world1his is my description, hello world1his is my description, hello world1")
		return [firstPage,secondPage,thirdPage]
	}()
	
	lazy var pageController : UIPageControl = {
		let pc = UIPageControl()
		pc.numberOfPages = pages.count
		pc.pageIndicatorTintColor = UIColor(white: 0.8, alpha: 1)
		pc.currentPageIndicatorTintColor = UIColor(red: 237/255, green: 87/255, blue: 33/255, alpha: 1.0)
		return pc
	}()
	
	let previousButton : UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("Previous", for: .normal)

		return button
	}()
	
	let nextButton : UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("Next", for: .normal)
		return button
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(collectionView)
		view.addSubview(pageController)
		view.addSubview(previousButton)
		view.addSubview(nextButton)
		
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		pageController.translatesAutoresizingMaskIntoConstraints = false
		previousButton.translatesAutoresizingMaskIntoConstraints = false
		nextButton.translatesAutoresizingMaskIntoConstraints = false
		
		collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
		collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
		collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
		
		
		pageController.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
		pageController.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		
		previousButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
		previousButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
		
		nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
		nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
		
		collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return pages.count
	}
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
		cell.page = pages[indexPath.item]
//		cell.backgroundColor = .red
		return cell
	}
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: view.frame.width, height: view.frame.height)
	}
	
}



