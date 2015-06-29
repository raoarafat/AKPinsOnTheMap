//
//  AKMapViewController.swift
//  AKPinsOnTheMap
//
//  Created by Arafat on 6/24/15.
//  Copyright (c) 2015 Arafat Khan. All rights reserved.
//


import UIKit
import MapKit

class AKMapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    var beaches: [AKBeaches] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.beaches = [
            Langkawi(mapString: "Chalang Beach", mediaURL: "https://www.google.com/", latitude: 6.3233, longitude:99.854724),
            Perhentian(mapString: "Perhentian beach", mediaURL: "https://www.google.com/", latitude: 5.903788, longitude: 102.753737),
            Tewmaan(mapString: "Tioman Beach", mediaURL: "https://www.google.com/", latitude: 2.790249, longitude:104.169846)]
        
        /* The reduce algorithm */
        
        let rectToDisplay = self.beaches.reduce(MKMapRectNull) {
            (mapRect: MKMapRect, treasure: AKBeaches) -> MKMapRect in

            let treasurePointRect =
            MKMapRect(origin: treasure.location.mapPoint,
                size: MKMapSize(width: 0, height: 0))
            return MKMapRectUnion(mapRect, treasurePointRect)

        }
        // 4
        self.mapView.setVisibleMapRect(rectToDisplay, edgePadding: UIEdgeInsetsMake(74, 10, 10, 10), animated: false)
        
        self.mapView.delegate = self
        self.mapView.addAnnotations(self.beaches)
        
        
        
        
    }
}

// MARK: Class extensions

extension AKMapViewController: MKMapViewDelegate {
    
    func mapView(mapView: MKMapView!,viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView!
    {
        // 1
        if let beach = annotation as? AKBeaches {
            // 2
            var view = mapView.dequeueReusableAnnotationViewWithIdentifier("pin") as! MKPinAnnotationView!
            if view == nil {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
                view.canShowCallout = true
                view.animatesDrop = false
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure) as! UIView
            }
            else
            {
                // 4
                view.annotation = annotation
            }
            // 5
            view.pinColor = AKBeaches.pinColor(beach)()
            return view
        }
        return nil
        
    }
    
    /* When ShowCallout Pressed  */
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        
        let location = view.annotation as! AKBeaches
        var url:String? = location.mediaURL
        if let requestUrl = NSURL(string: url!) {
            UIApplication.sharedApplication().openURL(requestUrl)
        }
        
    }
    
    
    
}