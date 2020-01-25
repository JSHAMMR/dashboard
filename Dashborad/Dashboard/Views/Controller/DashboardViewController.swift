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
    @IBOutlet var presnterProvider: PresenterProvider!
    @IBOutlet var jobProvider: JobsProvider!

    override func viewDidLoad() {
        
        self.dashboardListPresenter = self.dashboardPresenter()
        self.dashboardListPresenter?.fetchDashboardItems()

        self.presnterProvider.dashboardListPresenter = self.dashboardListPresenter
        self.presnterProvider.scrollView = self.scrollView
        
        self.presnterProvider.jobProvider = self.jobProvider

        self.dashboardListPresenter?.delegate = self.presnterProvider

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

