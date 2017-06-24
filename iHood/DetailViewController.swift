//
//  DetailViewController.swift
//  iHood
//
//  Created by Kadell on 6/24/17.
//  Copyright © 2017 Digimark Technical Solutions. All rights reserved.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 65.0/255.0, green: 66/255.0, blue: 84.0/255.0, alpha: 1)
        self.navigationItem.title = "Precinct"
        
        setupViewHierarchy()
        setUpConstraints()
    }

    
    
    func setupViewHierarchy() {
        self.view.addSubview(contactLabel)
        self.view.addSubview(contactDetailLabel)
        
        
    }
    
    func setUpConstraints() {
        self.edgesForExtendedLayout = []
        
       contactLabel.snp.makeConstraints { (view) in
            view.top.equalTo(topLayoutGuide.snp.bottom)
        }
        
        contactDetailLabel.snp.makeConstraints { (view) in
            view.top.equalTo(contactLabel.snp.bottom).offset(20)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    var contactLabel: UILabel = {
        var contactLabel = UILabel()
        contactLabel.text = "Contact Details"
        contactLabel.textColor = UIColor.white
        return contactLabel
    }()

    var contactDetailLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 2
        label.text = "3456 Howard St, Bronx, NY 18857 \n 718-555-5555"
        return label
    }()
}
