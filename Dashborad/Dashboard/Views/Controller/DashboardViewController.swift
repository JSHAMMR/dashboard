//
//  ViewController.swift
//  Dashborad
//
//  Created by Gamil Ali Qaid Shamar on 25/01/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    private var dashboardListPresenter: DashboardListPresenter?

    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        
        self.dashboardListPresenter = self.dashboardPresenter()
        self.dashboardListPresenter?.fetchDashboardItems()

        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    func dashboardPresenter() -> DashboardListPresenter {
           let networkLayer = Network()
           let dashboardViewModel = DashboardViewModel(networkLayer: networkLayer)
           let dashboardListPresenter = DashboardListPresenter(dashboardViewModel: dashboardViewModel)
           
           return dashboardListPresenter
    }
}

