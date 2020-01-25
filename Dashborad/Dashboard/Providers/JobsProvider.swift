//
//  JobsProvider.swift
//  Dashborad
//
//  Created by Gamil Ali Qaid Shamar on 25/01/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//


import UIKit

class JobsProvider: NSObject, UITableViewDataSource {
    
    var dashboardListPresenter: DashboardListPresenter?

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = self.dashboardListPresenter?.jobsCount() else {
            return 0
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierJob, for: indexPath) as! TableViewCell
        
        cell.jobItem = self.dashboardListPresenter?.getJob(index: indexPath.row)
        
        return cell
    }
    
    
}
