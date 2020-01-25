//
//  TableViewCell.swift
//  Dashborad
//
//  Created by Gamil Ali Qaid Shamar on 25/01/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//


import UIKit

class TableViewCell: UITableViewCell {

        @IBOutlet weak var titleLbl: UILabel!
        @IBOutlet weak var descriptionLbl: UILabel!
        @IBOutlet weak var growthLbl: UILabel!
        @IBOutlet weak var arrowImageView: UIImageView!

       
    var jobItem:JobItem! {
        didSet {
            titleLbl.text = jobItem.title
            descriptionLbl.text = jobItem.itemDescription
            growthLbl.text = "\(jobItem.growth!)"
            
            if jobItem.growth! < 0 {
                arrowImageView.image = UIImage(named: "down")
            } else {
                arrowImageView.image = UIImage(named: "up")
            }

        }
    }

}
