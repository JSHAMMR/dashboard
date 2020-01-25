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
    @IBOutlet var servicesProvider: ServicesProvider!

    @IBOutlet weak var scopeLbl: UILabel!
    fileprivate var scopes = ["ALL","TODAY","LAST_7_DAYS","LAST_30_DAYS"]
    fileprivate var scopesPickerView = UIPickerView()
    fileprivate var scopesValue = String()
    
    
    override func viewDidLoad() {
        
        self.dashboardListPresenter = self.dashboardPresenter()
        self.dashboardListPresenter?.fetchDashboardItems()

        self.presnterProvider.dashboardListPresenter = self.dashboardListPresenter
        self.presnterProvider.scrollView = self.scrollView
        
        self.presnterProvider.jobProvider = self.jobProvider
        self.presnterProvider.servicesProvider = self.servicesProvider

        self.dashboardListPresenter?.delegate = self.presnterProvider

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // challenge 2
        let maximumu = MaximumValueOperations()
    }


    func dashboardPresenter() -> DashboardListPresenter {
           let networkLayer = Network()
           let dashboardViewModel = DashboardViewModel(networkLayer: networkLayer)
           let dashboardListPresenter = DashboardListPresenter(dashboardViewModel: dashboardViewModel)
           
           return dashboardListPresenter
    }
    
    @IBAction func changeScope(_ sender: Any) {
       
       let alert = UIAlertController(title: "Dashboard filter", message: "Dashboard Data will filter based on this \n\n\n\n\n\n", preferredStyle: .actionSheet)
       alert.isModalInPopover = true
       
        let pickerFrame = UIPickerView(frame: CGRect(x: 0, y: 0, width: alert.view.frame.width, height: 200 ))
       
       alert.view.addSubview(pickerFrame)
       pickerFrame.dataSource = self
       pickerFrame.delegate = self
       
       alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
       alert.addAction(UIAlertAction(title: "Apply", style: .default, handler: { (UIAlertAction) in
           
        
        self.dashboardListPresenter?.fetchDashboardItems(scope: self.scopesValue )

        self.scopeLbl.text = self.scopesValue
       
       }))
       self.present(alert,animated: true, completion: nil )
        
    }
}

extension DashboardViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
     
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return scopes.count
    }
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return scopes[row]
    }
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       scopesValue = scopes[row]
    }
}
