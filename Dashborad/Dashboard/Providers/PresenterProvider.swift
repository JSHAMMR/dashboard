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

    func didFetchDashboardItems(success: Bool) {
        
        
        print(dashboardListPresenter)
        
    }
    

}
