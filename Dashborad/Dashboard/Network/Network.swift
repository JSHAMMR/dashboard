//
//  Network.swift
//  Dashborad
//
//  Created by Gamil Ali Qaid Shamar on 25/01/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//

import UIKit

open class Network: NSObject {
    open func executeGETRequest(api:String, completionBlock:@escaping (Data?) -> Void)  {

        guard let gitUrl = URL(string: DashboardApiUrL + api) else { return }
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let dataTask = session.dataTask(with: gitUrl) { (data, response, error) in
            guard let data = data else { return }
            do {
                if let returnData = String(data: data, encoding: .utf8) {
                    print(returnData)
                } else {
                    print("empty")
                }
            }
            
            if let err = error {
                print("Err", err)
            }
            
            completionBlock(data)
        }
        dataTask.resume()
    }
}
