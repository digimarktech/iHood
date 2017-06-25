//
//  DetailViewController.swift
//  iHood
//
//  Created by Kadell on 6/24/17.
//  Copyright © 2017 Digimark Technical Solutions. All rights reserved.
//

import UIKit
import SnapKit
import Cosmos

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 65.0/255.0, green: 66/255.0, blue: 84.0/255.0, alpha: 1)
        self.navigationItem.title = "Precinct"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 65.0/255.0, green: 66.0/255.0, blue: 84.0/255.0, alpha: 1)
        
        setupViewHierarchy()
        setUpConstraints()
        
        commentTableView.delegate = self
        commentTableView.dataSource = self
       
        
       
    }

    
    
    func setupViewHierarchy() {
        contactContainer.addSubview(contactLabel)
        contactContainer.addSubview(contactDetailLabel)
        
        precinctContainer.addSubview(precinctNameLabel)
        precinctContainer.addSubview(precientRating)
        
        self.view.addSubview(contactContainer)
        self.view.addSubview(precinctContainer)
        self.view.addSubview(commentTableView)
    }
    
    func setUpConstraints() {
        self.edgesForExtendedLayout = []
        
        
        contactContainer.snp.makeConstraints { (view) in
            view.top.equalTo(topLayoutGuide.snp.bottom)
            view.leading.equalToSuperview().offset(20)
            view.trailing.equalToSuperview().offset(20)
            
        }
        
       contactLabel.snp.makeConstraints { (view) in
            view.top.equalTo(contactContainer.snp.top).offset(10)
            view.leading.equalToSuperview()
            view.trailing.equalToSuperview()
        }
        
        contactDetailLabel.snp.makeConstraints { (view) in
            view.top.equalTo(contactLabel.snp.bottom).offset(20)
            view.leading.equalToSuperview()
            view.trailing.equalToSuperview()
            view.bottom.equalToSuperview()
        }
        
        precinctContainer.snp.makeConstraints { (view) in
            view.top.equalTo(contactContainer.snp.bottom).offset(20)
            view.leading.equalToSuperview().offset(20)
            view.trailing.equalToSuperview().offset(20)
        }
        
        precinctNameLabel.snp.makeConstraints { (view) in
            view.top.equalTo(precinctContainer.snp.top).offset(20)
            view.leading.equalToSuperview()
            view.trailing.equalToSuperview()
        }
        
        precientRating.snp.makeConstraints { (view) in
            view.top.equalTo(precinctNameLabel.snp.bottom).offset(10)
            view.leading.equalToSuperview()
            view.trailing.equalToSuperview()
            view.bottom.equalToSuperview()
        }
        
        commentTableView.snp.makeConstraints { (view) in
           view.top.equalTo(precinctContainer.snp.bottom).offset(20)
            view.leading.equalToSuperview()
            view.trailing.equalToSuperview()
            view.bottom.equalToSuperview()
        }
        
    }

    
    //MARK: - TableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentsTableViewCell
        cell.backgroundColor = UIColor(red: 65.0/255.0, green: 66/255.0, blue: 84.0/255.0, alpha: 1)
        cell.nameLabel.text = "William"
        cell.commentLabel.text = "Cops took a long time to come"
        return cell
    }

    

    // MARK: - Views

    var contactContainer: UIView = {
        var view = UIView()
        
        return view
    }()
    
    var precinctContainer: UIView = {
        var view = UIView()
        
        return view
    }()
    
    var commentTableView: UITableView = {
        var tableView = UITableView()
        tableView.register(CommentsTableViewCell.self, forCellReuseIdentifier: "CommentCell")
        tableView.backgroundColor = UIColor(red: 65.0/255.0, green: 66/255.0, blue: 84.0/255.0, alpha: 1)
        tableView.tableHeaderView?.tintColor = UIColor(red: 65.0/255.0, green: 66/255.0, blue: 84.0/255.0, alpha: 1)
        tableView.rowHeight = 80
        
        return tableView
    }()
    
    var contactLabel: UILabel = {
        var contactLabel = UILabel()
        contactLabel.text = "Contact Details"
        contactLabel.textColor = UIColor.white
        return contactLabel
    }()

    var contactDetailLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 2
        label.textColor = UIColor.white
        label.text = "3456 Howard St, Bronx, NY 18857 \n 718-555-5555"
        return label
    }()
    
    var precinctNameLabel: UILabel = {
        var label = UILabel()
        label.text = "Precinct Rating"
        label.textColor = UIColor.white
        return label
    }()
    
    var precientRating: CosmosView = {
        var view = CosmosView()
        view.rating = 4
        view.settings.totalStars = 5
        view.settings.starSize = 30
        return view
    }()
    
    
}
