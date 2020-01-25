//
//  DashboardListPresenter.swift
//  Dashborad
//
//  Created by Gamil Ali Qaid Shamar on 25/01/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//

import UIKit

protocol DashboardListPresenterDelegate : AnyObject {
    func didFetchDashboardItems(success:Bool)
}

class DashboardListPresenter: NSObject {
    weak var delegate: DashboardListPresenterDelegate?
    private let dashboardViewModel: DashboardViewModel
    private var dashboardModel: DashboardModel!
    
    init(dashboardViewModel:DashboardViewModel) {
           self.dashboardViewModel = dashboardViewModel
           super.init()
           self.dashboardViewModel.delegate = self
       }
    
    public func fetchDashboardItems (scope:String = "ALL") {
        self.dashboardViewModel.fetchDashboardItems(scope: scope)
    }
    
    public func getRating() -> Rating {
        
        guard let rating = dashboardModel.response?.data?.analytics?.rating else {
            return Rating()
        }
        return rating
    }

    public func getRatingDescription () -> String {
        guard let description = dashboardModel.response?.data?.analytics?.rating?.ratingDescription!else {
            return ""
        }
        return description
    }
    
    
    public func jobsCount() -> Int {
        
        guard let count = dashboardModel.response?.data?.analytics?.job?.items!.count else {
            return 0
        }
        return count
    }
    
    
    
}

extension DashboardListPresenter : DashboardListModelDelegate {
   
    func didFetchDashboardItems(success: Bool, dashboardItems: DashboardModel) {
        self.dashboardModel = dashboardItems
        
        if let delegate = self.delegate {
            delegate.didFetchDashboardItems(success: success)
            return
        }
    }
    
}
