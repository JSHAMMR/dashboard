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
    var servicesProvider:ServicesProvider!


    func didFetchDashboardItems(success: Bool) {
        DispatchQueue.main.async {
            
            self.addRatingView ()
            
            self.addJobsView ()
            
            self.addLineChartView ()
            
            self.addPieChartView ()
            
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
    
    
       func addJobsView () {

               let jobsView = (JobsView.instanceFromNib() as! JobsView)
               jobsView.frame =  CGRect(x: 0, y:heightContent, width:  screenSize.width, height: jobsView.frame.height)


               scrollView.addSubview(jobsView)
               jobsView.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierJob)

               jobsView.tableView.dataSource = self.jobProvider

               heightContent = heightContent + jobsView.frame.height

               scrollView.contentSize = CGSize(width: screenSize.width, height: heightContent)


               self.jobProvider.dashboardListPresenter = self.dashboardListPresenter
               jobsView.tableView.reloadData()
               jobsView.descLbl.text = self.dashboardListPresenter?.getJobDescription()
    

          }
    
    func addLineChartView () {
               
               self.dashboardListPresenter?.getLineCharts().first?.forEach({ (lineChart) in
               let lineChartView = (LineChartView.instanceFromNib() as! LineChartView)
               lineChartView.frame =  CGRect(x: 0, y:heightContent, width:  screenSize.width, height: lineChartView.frame.height)

               scrollView.addSubview(lineChartView)
               heightContent = heightContent + lineChartView.frame.height

               scrollView.contentSize = CGSize(width:  screenSize.width, height: heightContent)

               lineChartView.updateUI(lineChartItems: (lineChart.items!), desc: lineChart.lineChartDescription!)
               })
       
       
           }
    
    func addPieChartView () {
                 
              self.dashboardListPresenter?.getPieCharts().forEach({ (pieChart) in
              let pieChartView = (PieChartView.instanceFromNib() as! PieChartView)
              pieChartView.frame =  CGRect(x: 0, y:heightContent, width:  screenSize.width, height: pieChartView.frame.height)

              scrollView.addSubview(pieChartView)
              heightContent = heightContent + pieChartView.frame.height

              scrollView.contentSize = CGSize(width:  screenSize.width, height: heightContent)

              pieChartView.updateUI(valueElements: pieChart.items!, desc: pieChart.pieChartDescription!)
              })
         
         
             }
    

}
