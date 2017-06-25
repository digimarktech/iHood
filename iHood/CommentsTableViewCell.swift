//
//  CommentsTableViewCell.swift
//  iHood
//
//  Created by Kadell on 6/24/17.
//  Copyright © 2017 Digimark Technical Solutions. All rights reserved.
//

import UIKit
import SnapKit
import Cosmos

class CommentsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
       
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.setUpViewHierarchy()
    }
   
    
    func setUpViewHierarchy() {
        self.addSubview(nameLabel)
        self.addSubview(ratingLabel)
//        self.addSubview(dateLabel)
        self.addSubview(commentLabel)
        
      nameLabel.snp.makeConstraints { (view) in
        view.top.equalTo(self.contentView.snp.top).offset(10)
        view.leading.equalToSuperview().offset(20)
        
        }
        
        ratingLabel.snp.makeConstraints { (view) in
            view.leading.equalTo(nameLabel.snp.trailing).offset(20)
            view.top.equalTo(self.contentView.snp.top).offset(10)
        }
        
        commentLabel.snp.makeConstraints { (view) in
            view.top.equalTo(nameLabel.snp.bottom).offset(20)
            view.leading.equalToSuperview().offset(20)
        }
    
    }

    var nameLabel: UILabel = {
        var view = UILabel()
        view.textColor = UIColor.white
        return view
    }()
    
    var ratingLabel: CosmosView = {
        var view = CosmosView()
        view.settings.totalStars = 5
        view.settings.starSize = 20
        
        return view
    }()
    
    var dateLabel: UILabel = {
        var view = UILabel()
        
        return view
    }()
    
    
    var commentLabel: UILabel = {
        var view = UILabel()
        view.textColor = UIColor.white
        return view
    }()
}
