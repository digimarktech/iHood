//
//  NetworkRequestManager.swift
//  iHood
//
//  Created by Albert Schweitzer on 6/24/17.
//  Copyright © 2017 Digimark Technical Solutions. All rights reserved.
//

import Foundation


func getReportsData() {
    
    let apiURL = "https://data.cityofnewyork.us/resource/57mv-nv28.json"
    
    let url = URL(string: apiURL)!

    URLSession.shared.dataTask(with: url) { (data, response, error) in
        var reqData:Data
        var json:[AnyObject]
        
        if let myData:Data = data {
            reqData = data!
        }
        else { return }
        
        if let decodedJSON = try? JSONSerialization.jsonObject(with: reqData, options: []) as? [AnyObject] {
            
            json = try! JSONSerialization.jsonObject(with: reqData, options: []) as! [AnyObject]
            
        } else { return }
        
        parseJSON(jsonData: json)
        
        }.resume()
}



