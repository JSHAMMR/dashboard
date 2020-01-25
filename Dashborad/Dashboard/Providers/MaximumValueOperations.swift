//
//  MaximumValueOperations.swift
//  Dashborad
//
//  Created by Gamil Ali Qaid Shamar on 25/01/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//

import UIKit

class MaximumValueOperations {
    
    var n:Int!
    var m:Int!
    var a = [Int]()
    var b = [Int]()
    var k = [Int]()

    var queries = [[Int]]()
    
    init() {
        let input = "5 3\n1 2 100\n2 5 100\n3 4 100"
        let arrayByRows = input.components(separatedBy: "\n")
        if arrayByRows.count > 0 {
            do {
                let nm = try arrayByRows[0]
                let firstRowQ = try arrayByRows[1]
                let secondRowQ = try arrayByRows[2]
                let thirdRowQ = try arrayByRows[3]
                
                
                
               
                n = Int(nm.components(separatedBy: " ")[0])
                m = Int(nm.components(separatedBy: " ")[1])

                for index in 0...2 {
                    if index == 0 {
                        a.append(Int(firstRowQ.components(separatedBy: " ")[index])!)
                        a.append(Int(secondRowQ.components(separatedBy: " ")[index])!)
                        a.append(Int(thirdRowQ.components(separatedBy: " ")[index])!)

                    }
                    
                    if index == 1 {
                        b.append(Int(firstRowQ.components(separatedBy: " ")[index])!)
                        b.append(Int(secondRowQ.components(separatedBy: " ")[index])!)
                        b.append(Int(thirdRowQ.components(separatedBy: " ")[index])!)

                    }
                    
                    if index == 2 {
                        k.append(Int(firstRowQ.components(separatedBy: " ")[index])!)
                        k.append(Int(secondRowQ.components(separatedBy: " ")[index])!)
                        k.append(Int(thirdRowQ.components(separatedBy: " ")[index])!)

                    }
                    
                    
                }
                

                print("n = \(n as Int) m = \(m as Int) a = \(a) b =\(b) k = \(k)")

                
                queries.append(a)
                queries.append(b)
                queries.append(k)

                

            } catch let error {
                print(error)
            }
        }
        
        
    }

    func arrayManipulation(n: Int, m: Int, queries: [[Int]]) -> Int {
        
        return 0
    }
    
}
