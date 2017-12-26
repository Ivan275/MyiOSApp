//
//  SettingController.swift
//  QiChat
//
//  Created by Qiqi He on 2017-12-24.
//  Copyright © 2017 Qiqi He. All rights reserved.
//

import UIKit
import GoogleMaps

class SettingController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		GMSServices.provideAPIKey("AIzaSyAdYBIE8DNh2EJtUP2kzsPEyCiFRdtjD_0")
		let camera = GMSCameraPosition.camera(withLatitude: 49.287253,   longitude: -123.132921, zoom: 13)
		let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
		view = mapView
		
		let marker = GMSMarker()
		marker.position = CLLocationCoordinate2D(latitude: 49.287253, longitude: -123.132921)
		marker.title = "Vancouver"
		marker.map = mapView
	}
}
