//
//  GoogleMapViewController.swift
//  FDT
//
//  Created by Henry Tsai on 9/27/14.
//  Copyright (c) 2014 unet. All rights reserved.
//

import Foundation
import UIKit

class GoogleMapViewController: UIViewController {
    var mapView:GMSMapView!

    override func viewDidLoad() {
    var target: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 37.7822671, longitude: -122.3912479)
    var camera: GMSCameraPosition = GMSCameraPosition(target: target, zoom: 11, bearing: 0, viewingAngle: 0)
        
    mapView = GMSMapView(frame:CGRectZero)
    mapView.myLocationEnabled = true;
    mapView.camera = camera
    // mapView.delegate = self
        
    self.view = mapView;
    // Creates a marker in the center of the map.
    var marker:GMSMarker = GMSMarker();
    marker.position = CLLocationCoordinate2DMake(37.7822671, -122.3912479);
    marker.title = "San Francisco";
    marker.snippet = "Github";
    marker.opacity = 0.4
    marker.map = mapView;
    
    let lat_array:[Double] = [37.7901196, 37.7697686, 37.801041, 37.7670627, 37.7697686] //, 37.8201487]
    let long_array:[Double] = [-122.3910198, -122.4120492, -122.457767, -122.4466616] //, -122.3689871]


    for i in 0...3 {
        var marker:GMSMarker = GMSMarker();
        marker.position = CLLocationCoordinate2DMake(lat_array[i], long_array[i]);
        // marker1.title = "San Francisco";
        // marker1.snippet = "Github";
        marker.map = mapView;
    }
  }
    
}


