//
//  RatingView.swift
//  Dashborad
//
//  Created by Gamil Ali Qaid Shamar on 25/01/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//

import UIKit

class RatingView: UIView {

    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var ratingValueLbl: UILabel!
    @IBOutlet weak var votedLbl: UILabel!
    
      override func draw(_ rect: CGRect) {
        // Drawing code
    }
    

    class func instanceFromNib() -> UIView {
        return UINib(nibName: "RatingView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
