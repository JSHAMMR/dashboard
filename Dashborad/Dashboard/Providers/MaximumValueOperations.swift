//
//  MaximumValueOperations.swift
//  Dashborad
//
//  Created by Gamil Ali Qaid Shamar on 25/01/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//

import UIKit

class MaximumValueOperations {
    
   

    var queries = [[Int]]()
    
    
    
    
    init() {
        
        var n:Int!
        var m:Int!
        var a = [Int]()
        var b = [Int]()
        var k = [Int]()
        
        
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

                print(self.constraint(n: n, m: m, queries: queries))
                
                if self.constraint(n: n, m: m, queries: queries) {
                    print("Maximum value after \(m) operations is : \(self.arrayManipulation(n: n, m: m, queries: queries))")

                }

            } catch let error {
                print(error)
            }
        }
        
        
    }

    func arrayManipulation(n: Int, m: Int, queries: [[Int]]) -> Int {
        
        let zeroCount  = n + 1
        var zeroArray = [Int](repeating: 0, count: zeroCount)
        
        // Start performing 'm' operations
        
        let a = queries[0]
        let b = queries[1]
        let  k = queries[2]


        for i in 0...m-1 {
            let lowerbound = a[i]
            let upperbound = b[i]
            
            // Add k to the lower_bound
            zeroArray[lowerbound] += k[i]

            // Reduce upper_bound+1
            // indexed value by k
            if upperbound < zeroArray.count - 1 {
                zeroArray[upperbound + 1] -= k[i]

            }
            
        }

        // Find maximum sum
        // possible from all values
        var sum = 0
        var res = UInt8.min
        for i in 0...n {
            sum += zeroArray[i]

            res = max(res, UInt8(sum));

        }
       
        return Int(res)
        
    }
    
    
    func constraint (n: Int, m: Int, queries: [[Int]]) -> Bool {
        var check = true
        
        if n < 3 || n > 10000000 {
            return false
        }
        if m < 1 || n > 200000 {
            return false
        }
        
        if queries[0].count < 1 || queries[0].count > queries[1].count ||  queries[1].count > n{
            return false
        }
        
        if queries[2].count < 0 || n > 1000000000 {
            return false
        }
        
        
        return check
    }
    
}
