//
//  MapAnnotationManager.swift
//  iHood
//
//  Created by Albert Schweitzer on 6/24/17.
//  Copyright © 2017 Digimark Technical Solutions. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

struct complaint {
    var coordinates: CLLocationCoordinate2D?
    var borough: String?
    var shortDescription: String?
    var longDescription: String?
    var premise: String?
    var jurisdiction: String?
    
}

    
func parseJSON(jsonData: [AnyObject]) {
    
    
    var complaints = [complaint]()
    
    for incident in jsonData {
        
        var crime = complaint()
        
        
        guard let lat = incident.object(forKey: "latitude") as? String else { continue }
        
        guard let long = incident.object(forKey: "longitude") as? String else { continue }
        
        let CLLat = CLLocationDegrees(lat)!
        
        let CLLong = CLLocationDegrees(long)!
        
        guard let boro = incident.object(forKey: "boro_nm") as? String else { continue }
        
        guard let shortDesc = incident.object(forKey: "ofns_desc") as? String else { continue }
        
        guard let longDesc = incident.object(forKey: "pd_desc") as? String else { continue }
        
        guard let premType = incident.object(forKey: "prem_typ_desc") as? String else { continue }
        
        guard let juris = incident.object(forKey: "juris_desc") as? String else { continue }
         
        crime.coordinates = CLLocationCoordinate2D(latitude: CLLat, longitude: CLLong)
        crime.borough = boro
        crime.shortDescription = shortDesc
        crime.longDescription = longDesc
        crime.premise = premType
        crime.jurisdiction = juris
        
        complaints.append(crime)

    }
    
//    print(complaints)
    DispatchQueue.main.async {
        MapViewController().placeMapAnnotations(complaints: complaints)
    }
    
}

