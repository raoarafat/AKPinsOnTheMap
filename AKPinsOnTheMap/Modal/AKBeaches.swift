//
//  AKBeaches.swift
//  AKPinsOnTheMap
//
//  Created by Arafat on 6/24/15.
//  Copyright (c) 2015 Arafat Khan. All rights reserved.
//

import Foundation
import MapKit

class AKBeaches: NSObject {
    
    var mapString: String? = nil
    var mediaURL: String? = nil
    var location: GeoLocation
    
    
    
    
    /* Designating Initializer */
    init(mapString: String, mediaURL: String, location: GeoLocation) {
        self.mapString = mapString
        self.mediaURL = mediaURL
        self.location = location
    }
    
    /* Convenience Initializer */
    convenience init(mapString: String, mediaURL: String, latitude: Double, longitude: Double) {
        
        let location = GeoLocation(latitude: latitude, longitude: longitude)
        
        /* Calling Designating Initializer */
        self.init(mapString: mapString, mediaURL: mediaURL, location: location)
    }
    
    /*To change Annotation Pin Color Accordingly, also it can be overrided*/
    func pinColor() -> MKPinAnnotationColor {
        return MKPinAnnotationColor.Red
    }
    
}

// MARK: Child Classes

class Langkawi: AKBeaches {
    
    init(mapString: String, mediaURL: String, latitude: Double, longitude: Double) {
        let location = GeoLocation(latitude: latitude,longitude: longitude)
        super.init(mapString: mapString, mediaURL: mediaURL, location: location)
    }
}

class Tewmaan: AKBeaches {
    
    init(mapString: String, mediaURL: String, latitude: Double, longitude: Double) {
        let location = GeoLocation(latitude: latitude,longitude: longitude)
        super.init(mapString: mapString, mediaURL: mediaURL, location: location)
        
    }
    
    override func pinColor() -> MKPinAnnotationColor {
        return MKPinAnnotationColor.Purple
    }
}

class Perhentian: AKBeaches {
    
    init(mapString: String, mediaURL: String, latitude: Double, longitude: Double) {
        let location = GeoLocation(latitude: latitude,longitude: longitude)
        super.init(mapString: mapString, mediaURL: mediaURL, location: location)
    }
    
    override func pinColor() -> MKPinAnnotationColor { return MKPinAnnotationColor.Green
    }
}


// MARK: Class extensions and computed properties
extension AKBeaches: MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        return self.location.coordinate
    }
    var title: String {
        return self.mapString!
    }
}

