//
//  MapViewController.swift
//  FolkArt
//
//  Created by Luke Karns on 4/13/17.
//  Copyright © 2017 Luke Karns. All rights reserved.
//

import UIKit
import MapKit
import RealmSwift

class MapViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!

    let realm = try! Realm()
    let results = try! Realm().objects(Booth.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        let initialLocation = CLLocation(latitude: 35.6648418, longitude: -105.9257754)
        centerMapOnLocation(location: initialLocation)
        mapView.mapType = .hybrid

        // Add our booths
        NSLog("Booths count: %d", results.count)
        for booth in results {
          mapView.addAnnotation(booth)
        }
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    let regionRadius: CLLocationDistance = 50
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    // MapViewDelegate
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Booth {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKPinAnnotationView { // 2
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                
                let button = UIButton(type: .detailDisclosure)
                button.addTarget(self, action: #selector(disclosureButtonPressed), for: .touchUpInside)
                
                view.rightCalloutAccessoryView = button as UIView
            }
            return view
        }
        return nil
    }
    
    func disclosureButtonPressed() {
        let annotation = mapView.selectedAnnotations.first! as! Booth
        //Show artist in view controller
        let vc = storyboard?.instantiateViewController(withIdentifier: "ArtistViewController") as? ArtistViewController
        vc?.artist = annotation.artists.first
        show(vc!, sender: self)
    }
    var locationManager = CLLocationManager()
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }
}
