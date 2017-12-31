# QiChat

The purpose of this projects is to create a community for Artists and photographers to show off their artworks as well as photos.

## Getting Started

git clone https://github.com/Ivan275/MyiOSApp.git

### Prerequisites

You need install git and pod in you local machine

```
git install
pod install
```

### Installing

A step by step series of examples that tell you have to get a development env running

Say what the step will be

```
git install
pod install
```


End with an example of getting some data out of the system or using it for a little demo

## Hightlight Contents of the App

* Introduction page with Swipping horizontal features
* Loggin page with Facebook Authetication login through Facebook SDK
* Animation of buttons with smonthly disappear
* Navigation of Main User Interface with Tap bar
* Map displays in location by Google SDK
* Add Photos and list contacts

Explain how to run the automated tests for this system

###  coding style

1. AutoLayout Function 1

```
view.addSubview(collectionView)
collectionView.translatesAutoresizingMaskIntoConstraints = false
collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true

```
2. AutoLayout Function 2

```
addSubview(selectedImage)
selectedImage.translatesAutoresizingMaskIntoConstraints = false
addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": selectedImage]))
addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": selectedImage]))
```

3. UIcollectionView -Data Source and Delegate

```
private let scrollCellId = "scrollId"

collectionView?.register(DetailScrollImageCell.self, forCellWithReuseIdentifier: scrollCellId)

override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
	return 2
}
override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
	return collectionView.dequeueReusableCell(withReuseIdentifier: scrollCellId, for: indexPath) as! DetailScrollImageCell
}

class DetailImageCell: UICollectionViewCell {
.....
}

```
4. Animation button disappear in the screen

```
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

```

5. Auto adjust to fit height text
```
let attributeString = NSMutableAttributedString(string: page.title, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium), NSAttributedStringKey.foregroundColor: UIColor(white: 0.2, alpha: 1)])
attributeString.append(NSAttributedString(string: "\n\n \(page.description)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor(white: 0.2, alpha: 1)]))
let paragraphStyle = NSMutableParagraphStyle()
paragraphStyle.alignment = .center
let length = attributeString.string.count
attributeString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
textArea.attributedText = attributeString
```
6. Data persistence for user login - User Dafault (store small piece of data)

```
func finishLogin() {
	UserDefaults.standard.setLogin(value: true)
}

func isLogin() -> Bool {
	return UserDefaults.standard.getLogin()
}

extension UserDefaults {

	func setLogin(value: Bool) {
		set(value, forKey: "isLoggedIn")
		synchronize()
	}

	func getLogin() -> Bool {
		return bool(forKey: "isLoggedIn")
	}
}
```

7. ObserveKeyboard - show and end keyboard

```
func observeKeyboard() {
	NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard), name: .UIKeyboardWillShow, object: nil)

	NotificationCenter.default.addObserver(self, selector: #selector(endKeyboard), name: .UIKeyboardWillHide, object: nil)
}
```
8. Adding Tap in main TapBarController

```
var gallery : GalleryController?
var contact : ContactController?
var setting : SettingController?
var subViewController: [UIViewController] = []

override func viewDidLoad() {
	super.viewDidLoad()
	gallery = GalleryController()
	contact = ContactController()
	setting = SettingController()
	subViewController.append(gallery)
	subViewController.append(contact)
	subViewController.append(setting)
	gallery.tabBarItem.tag = 0
	contact.tabBarItem.tag = 1
	setting.tabBarItem.tag = 2
	self.setViewControllers(subViewController, animated: true)

```

<img src="http://www.dreampacers.com/wp-content/uploads/2017/12/home1.png" width="200"><img src="http://www.dreampacers.com/wp-content/uploads/2017/12/home2.png" width="200"><img src="http://www.dreampacers.com/wp-content/uploads/2017/12/home3.png" width="200"><img src="http://www.dreampacers.com/wp-content/uploads/2017/12/home4.png" width="200"><img src="http://www.dreampacers.com/wp-content/uploads/2017/12/home5.png" width="200"><img src="http://www.dreampacers.com/wp-content/uploads/2017/12/home.png" width="200">


## Authors

* **Ivan He** - *Software Developer* - [Home Website](www.dreampacers.com)

See other project in the list of [contributors](http://www.dreampacers.com/posts/) in my project.

## License

This project is licensed under the Ivan He.


