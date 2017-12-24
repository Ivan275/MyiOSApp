//
//  ViewController.swift
//  QiChat
//
//  Created by Qiqi He on 2017-12-20.
//  Copyright © 2017 Qiqi He. All rights reserved.
//

import UIKit

protocol loginControllerDelegate : class {
	func finishLogin()
}

class LoginViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,loginControllerDelegate{
	
	let cellId = "cellId"
	let loginId = "loginId"
	
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
		pc.numberOfPages = pages.count + 1
		pc.pageIndicatorTintColor = UIColor(white: 0.8, alpha: 1)
		pc.currentPageIndicatorTintColor = UIColor(red: 237/255, green: 87/255, blue: 33/255, alpha: 1.0)
		return pc
	}()
	
	let skipButton : UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("Skip", for: .normal)
		button.addTarget(self, action: #selector(skipAction), for: .touchUpInside)
		return button
	}()
	
	let nextButton : UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("Next", for: .normal)
		button.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
//		UITapGestureRecognizer(target: .self, action: #Select(nextAction()))
		return button
	}()
	
	var pageConstraint : NSLayoutConstraint?
	var skipConstraint : NSLayoutConstraint?
	var nextConstraint : NSLayoutConstraint?

	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(collectionView)
		view.addSubview(pageController)
		view.addSubview(skipButton)
		view.addSubview(nextButton)
		observeKeyboard()
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		pageController.translatesAutoresizingMaskIntoConstraints = false
		skipButton.translatesAutoresizingMaskIntoConstraints = false
		nextButton.translatesAutoresizingMaskIntoConstraints = false
		
		collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
		collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
		collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
		
		
		pageConstraint = pageController.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
		pageConstraint?.isActive = true
		pageController.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		
		skipConstraint = skipButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
		skipConstraint?.isActive = true
		skipButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
		
		nextConstraint = nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
		nextConstraint?.isActive = true
		nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
//		view.bounds = CGRect(x: 0, y: 25, width: view.frame.width + 40, height: view.frame.height + 40)
		collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
		collectionView.register(loginCell.self, forCellWithReuseIdentifier: loginId)
	}
	@objc func skipAction() {
		pageController.currentPage = pages.count-1
		nextAction()
//		let indexPath = IndexPath(item: item, section: 0)
//		collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//		pageController.currentPage = pages.count
//		if(pageController.currentPage == pages.count){
//			disappearButtonsAndPageController()
//		}
		
	}
	
	func finishLogin() {
		let rootView = UIApplication.shared.keyWindow?.rootViewController
		guard let mainNav = rootView as? MainController else { return }
		
		UserDefaults.standard.setLogin(value: true)
		
		mainNav.viewControllers = [HomeController()]
		dismiss(animated: true, completion: nil)
		
	}
	
	private func disappearButtonsAndPageController() {
		if(pageController.currentPage == pages.count) {
			pageConstraint?.constant = 30
			skipConstraint?.constant = -30
			nextConstraint?.constant = 30
		} else {
			pageConstraint?.constant = 0
			skipConstraint?.constant = 20
			nextConstraint?.constant = -20
		}
		
		UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
			self.view.layoutIfNeeded()
		}, completion: nil)
	}
	
	@objc func nextAction() {
		let item = min(pages.count, pageController.currentPage + 1)
		let indexPath = IndexPath(item: item, section: 0)
		collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
		pageController.currentPage = item
		if(pageController.currentPage == pages.count){
			disappearButtonsAndPageController()
		}
	}
	
	func observeKeyboard() {
		NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard), name: .UIKeyboardWillShow, object: nil)
		
		NotificationCenter.default.addObserver(self, selector: #selector(endKeyboard), name: .UIKeyboardWillHide, object: nil)
	}
	
	@objc func showKeyboard (){
		
		UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
			let y : CGFloat = UIDevice.current.orientation.isLandscape ? -170 : -40
			self.view.frame = CGRect(x: 0, y: y, width: self.view.frame.width, height: self.view.frame.height)
		}, completion: nil)
		
	}
	
	@objc func endKeyboard() {
		UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
			self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
		}, completion: nil)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return pages.count + 1
	}
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		if(indexPath.item < pages.count){
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
			cell.page = pages[indexPath.item]
			return cell
		}else{
			let login = collectionView.dequeueReusableCell(withReuseIdentifier: loginId, for: indexPath) as! loginCell
			login.delegate = self
			return login
		}
	}
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: view.frame.width, height: view.frame.height)
	}
	
	func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
		let frame = view.frame.width
		pageController.currentPage = Int(targetContentOffset.pointee.x / frame)
		disappearButtonsAndPageController()
	}
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		view.endEditing(true)
	}
	
	override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
//		print(UIDevice.current.orientation.isLandscape)
		collectionView.collectionViewLayout.invalidateLayout()
		
		let indexPath = IndexPath(item:  pageController.currentPage, section: 0)
		DispatchQueue.main.async {
			self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
			self.collectionView.reloadData()
		}
		
	}
	
}



