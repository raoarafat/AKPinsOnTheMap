//
//  GeoLocation.swift
//  AKPinsOnTheMap
//
//  Created by Arafat on 6/24/15.
//  Copyright (c) 2015 Arafat Khan. All rights reserved.
//

import Foundation
import MapKit

struct GeoLocation {
    var latitude: Double
    var longitude: Double
}

// MARK: Class extensions and computed properties

extension GeoLocation {
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake( self.latitude, self.longitude)
    }
    var mapPoint: MKMapPoint {
        return MKMapPointForCoordinate(self.coordinate)
    }
}