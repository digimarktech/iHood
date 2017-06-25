//
//  ViewController.swift
//  iHood
//
//  Created by Marc Aupont on 6/24/17.
//  Copyright © 2017 Digimark Technical Solutions. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    let mapKit = MKMapView()
    var complaints = [complaint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            getReportsData()
            self.view = mapKit
        
    }
    
    func placeMapAnnotations(complaints: [complaint] ) {
        
        for complaint in complaints {
            let pin = MKPointAnnotation()
            pin.coordinate = complaint.coordinates!
            pin.title = complaint.shortDescription!
            pin.subtitle = complaint.longDescription!
            
            self.mapKit.addAnnotation(pin)
            
            
        }
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

