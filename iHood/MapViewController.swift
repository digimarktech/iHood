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
    
    override func viewDidLoad() {
        super.viewDidLoad()
            getReportsData()
        
            self.view = mapKit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

