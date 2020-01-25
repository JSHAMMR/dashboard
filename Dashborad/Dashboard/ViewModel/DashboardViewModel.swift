//
//  DashboardViewModel.swift
//  Dashborad
//
//  Created by Gamil Ali Qaid Shamar on 25/01/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//


import UIKit

protocol DashboardListModelDelegate : AnyObject {
    func didFetchDashboardItems(success:Bool, dashboardItems:DashboardModel)
}

open class DashboardViewModel {
    weak var delegate: DashboardListModelDelegate?
    private let networkLayer: Network

    init(networkLayer:Network) {
        self.networkLayer = networkLayer
    }
    
    open func fetchDashboardItems(scope:String = "All") {
        self.networkLayer.executeGETRequest(api: scope, completionBlock: { (data) in
           
            
            var dashboardModel:DashboardModel?
            
            if let dashboardItemsData = data {
                let dashboardParser = DashboardParser()
                dashboardModel = dashboardParser.parseDashboardItems(data: dashboardItemsData)
                if let delegate = self.delegate {
                    delegate.didFetchDashboardItems(success: true, dashboardItems: dashboardModel!)
                    return
                }
            }
            
            if let delegate = self.delegate {
                delegate.didFetchDashboardItems(success: false, dashboardItems: dashboardModel!)
                return
            }
        })
    }
}
