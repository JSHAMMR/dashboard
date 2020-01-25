//
//  PieChartView.swift
//  Dashborad
//
//  Created by Gamil Ali Qaid Shamar on 25/01/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//

import UIKit
import AnyChartiOS

class PieChartView: UIView {
    @IBOutlet weak var pieChart: AnyChartView!
    
    @IBOutlet weak var descLbl: UILabel!
    
    
    func updateUI (valueElements:[ValueElement], desc:String) {
        
        let chart = AnyChart.pie()
     


        var data = Array<ValueDataEntry>()
        valueElements.forEach { (valueElement) in
            data.append(ValueDataEntry(x:valueElement.key!, value: (valueElement.value)!))
        }
        
         
        chart.data(data: data)

        chart.title(settings: desc)
        descLbl.text = desc

        chart.labels().position(position: "outside")

        chart.legend().title().enabled(enabled: true)
        chart.legend().title()
        .text(text: "")
        .padding(value1: 0, value2: 0, value3: 10, value4: 0)

        chart.legend()
        .position(position: "center-bottom")
        .itemsLayout(layout: anychart.enums.LegendLayout.HORIZONTAL)
        .align(align: anychart.enums.Align.CENTER)

        pieChart.setChart(chart: chart)
         
    }

      override func draw(_ rect: CGRect) {
        
        
        // Drawing code
    }
    

    class func instanceFromNib() -> UIView {
        return UINib(nibName: "PieChartView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}


