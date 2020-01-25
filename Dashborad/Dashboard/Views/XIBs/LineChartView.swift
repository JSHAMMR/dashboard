//
//  LineChartView.swift
//  Dashborad
//
//  Created by Gamil Ali Qaid Shamar on 25/01/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//


import UIKit
import AnyChartiOS

class LineChartView: UIView {
    @IBOutlet weak var lineChart: AnyChartView!
    
    @IBOutlet weak var descLbl: UILabel!
    
    
    func updateUI (lineChartItems:[LineChartItem], desc:String) {
        
        let chart = AnyChart.line()
         chart.animation(settings: true)

         chart.padding(padding: [10, 20, 5, 20])

         chart.crosshair().enabled(enabled: true)
         chart.crosshair().yLabel(settings: true)

         chart.tooltip().positionMode(mode: anychart.enums.TooltipPositionMode.POINT)

         chart.title(settings: desc)

         descLbl.text = desc
//         chart.yAxis(index: 0).title(settings: "Number of Bottles Sold (thousands)")
//         chart.xAxis(index: 0).labels().padding(padding: 5)

        var data = Array<LineDataEntry>()
        lineChartItems.forEach { (lineChartItem) in
            data.append(LineDataEntry(x: lineChartItem.key!, value: (lineChartItem.value?.first!.value!)!, value2: (lineChartItem.value?.last!.value!)!))
        }
        
         

         let set = anychart.data.Set().instantiate()
         set.data(data: data)
         let series1Mapping = set.mapAs(mapping: "{x: 'x', value: 'value'}")
         let series2Mapping = set.mapAs(mapping: "{x: 'x', value: 'value2'}")
         
         let series1 = chart.line(data: series1Mapping)
        series1.name(name: (lineChartItems.first?.value?.first!.key)!)
        series1.color(color: "blue")
         series1.hovered().markers().enabled(enabled: true)
         series1.hovered().markers()
             .type(type: anychart.enums.MarkerType.CIRCLE)
             .size(size: 4)
         series1.tooltip()
             .position(position: "right")
             .anchor(anchor: anychart.enums.Anchor.LEFT_CENTER)
             .offsetX(offset: 5)
             .offsetY(offset: 5)
         
         let series2 = chart.line(data: series2Mapping)
        series2.name(name: (lineChartItems.first?.value?.last!.key)!)
        series1.color(color: "red")

         series2.hovered().markers().enabled(enabled: true)
         series2.hovered().markers()
             .type(type: anychart.enums.MarkerType.CIRCLE)
             .size(size: 4)
         series2.tooltip()
             .position(position: "right")
             .anchor(anchor: anychart.enums.Anchor.LEFT_CENTER)
             .offsetX(offset: 5)
             .offsetY(offset: 5)
         
        
         
         chart.legend().enabled(enabled: true)
         chart.legend().fontSize(size: 13)
         chart.legend().padding(padding: [0, 0, 10, 0])
         
         lineChart.setChart(chart: chart)
         
    }

      override func draw(_ rect: CGRect) {
        
        
        // Drawing code
    }
    

    class func instanceFromNib() -> UIView {
        return UINib(nibName: "LineChartView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
class LineDataEntry: ValueDataEntry {
    init(x: String, value: Double, value2: Double) {
        super.init(x: x, value: value)
        setValue(key: "value2", value: value2)
    }
}
