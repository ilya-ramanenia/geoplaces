//
//  ViewController.swift
//  GeoPlaces
//
//  Created by Ilya Ramanenia on 6/29/18.
//  Copyright © 2018 ilyaramanenia. All rights reserved.
//

import UIKit
import GoogleMaps

class MapVC: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    @IBOutlet weak var mapView: GMSMapView!
    fileprivate var places = Place.fakePlaces
    
    fileprivate let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.isMyLocationEnabled = true
        mapView.setMinZoom(12, maxZoom: 16)
        
        for place in places {
            let marker = GMSMarker(position: place.coordinate)
            marker.title = place.name
            let width = CGFloat(6 + pow(2.5, 1 + place.score / 1.5))
            let circleView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: width))
            circleView.layer.cornerRadius = width / 2
            circleView.backgroundColor = UIColor.red.blend(UIColor.blue, proportion: CGFloat(place.score / 5))
            marker.iconView = circleView
            marker.groundAnchor  = CGPoint(x: 0.5, y: 0.5)
            
            marker.userData = place
            marker.map = mapView
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Google Maps
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        if let place = marker.userData as? Place {
            let placeVC = PlaceVC.instantiate()
            placeVC.place = place
            navigationController?.pushViewController(placeVC, animated: true)
        }
        
        return true
    }
    
    // MARK: - Location Manager
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)
        
        mapView?.animate(to: camera)
        
        //Finally stop updating location otherwise it will come again and again in this delegate
        locationManager.stopUpdatingLocation()
    }
}

