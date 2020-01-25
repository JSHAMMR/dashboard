//
//  ServicesView.swift
//  Dashborad
//
//  Created by Gamil Ali Qaid Shamar on 25/01/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//

import UIKit

class ServicesView: UIView {

    
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    

    class func instanceFromNib() -> UIView {
        return UINib(nibName: "ServicesView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
