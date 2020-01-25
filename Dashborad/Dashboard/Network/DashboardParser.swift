//
//  DashboardParser.swift
//  Dashborad
//
//  Created by Gamil Ali Qaid Shamar on 25/01/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//


import UIKit

public class DashboardParser: NSObject {

    func parseDashboardItems(data:Data) -> DashboardModel {
        
        
        var dashboardModel : DashboardModel?
        do {
            
            dashboardModel = try JSONDecoder().decode(DashboardModel.self, from: data)
            
        } catch let error as NSError {
            print(error)
        }
        return dashboardModel!
    }
    
}
