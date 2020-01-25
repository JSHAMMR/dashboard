//
//  PresenterProvider.swift
//  Dashborad
//
//  Created by Gamil Ali Qaid Shamar on 25/01/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//

import UIKit

class PresenterProvider: NSObject, DashboardListPresenterDelegate {
    
    
    var dashboardListPresenter: DashboardListPresenter?
    var scrollView: UIScrollView!
    let screenSize = UIScreen.main.bounds
    private var heightContent:CGFloat = 0
    
    var jobProvider:JobsProvider!


    func didFetchDashboardItems(success: Bool) {
        DispatchQueue.main.async {
            self.addRatingView ()
            
        }
    }
    
    func addRatingView () {
              
              let ratingView = (RatingView.instanceFromNib() as! RatingView)
              ratingView.descLbl.text = self.dashboardListPresenter?.getRatingDescription()

              ratingView.frame =  CGRect(x: 0, y:heightContent, width:  screenSize.width, height: ratingView.frame.height)
      
              scrollView.addSubview(ratingView)
              heightContent = heightContent + ratingView.frame.height
              
              let rating =
                  ((5*(self.dashboardListPresenter?.getRating().items!.the5)!) +
                  (4*(self.dashboardListPresenter?.getRating().items!.the4)!) +
                  (3*(self.dashboardListPresenter?.getRating().items!.the3)!) +
                  (2*(self.dashboardListPresenter?.getRating().items!.the2)!) +
                  (1*(self.dashboardListPresenter?.getRating().items!.the1)!)) /
                  ((self.dashboardListPresenter?.getRating().items!.the5)! +
                  (self.dashboardListPresenter?.getRating().items!.the4)! +
                  (self.dashboardListPresenter?.getRating().items!.the3)! +
                  (self.dashboardListPresenter?.getRating().items!.the2)! +
                  (self.dashboardListPresenter?.getRating().items!.the1)!)

              let votes =
                  ((self.dashboardListPresenter?.getRating().items!.the5)! +
                  (self.dashboardListPresenter?.getRating().items!.the4)! +
                  (self.dashboardListPresenter?.getRating().items!.the3)! +
                  (self.dashboardListPresenter?.getRating().items!.the2)! +
                  (self.dashboardListPresenter?.getRating().items!.the1)!)
              
              ratingView.ratingValueLbl.text = String(format: "%.1f", Float(rating))
              ratingView.votedLbl.text = String(format: "out of 5  %.1f  Rating", Float(votes))

              scrollView.contentSize = CGSize(width:  screenSize.width, height: heightContent)
      
      
          }
    

}
