
// class
/**
 * 
 */
 extension anychart.core.stock.indicators {
    public class CHO: JsObject {

        //override init() {
        //    super.init()
        //}

        public override init() {
            super.init()
            //return CHO(jsBase: "new anychart.core.stock.indicators.CHO()")
            //super.init(jsBase: "new anychart.core.stock.indicators.CHO()")
        }

        

        public override init(jsBase: String) {
            super.init()

            JsObject.variableIndex += 1
            self.jsBase = "cHO\(JsObject.variableIndex)"
            APIlib.sharedInstance.jsDelegate?.jsAddLine(jsLine: self.jsBase + " = " + jsBase + ";")
        }

        public func instantiate() -> anychart.core.stock.indicators.CHO {
            return anychart.core.stock.indicators.CHO(jsBase: "new anychart.core.stock.indicators.cho()")
        }

        override public func getJsBase() -> String {
            return jsBase;
        }

        
    /**
     * Getter for the fast period.
     */
    public func fastPeriod()  {
        APIlib.sharedInstance.jsDelegate?.jsAddLine(jsLine: self.jsBase + ".fastPeriod();")
    }
    /**
     * Setter for the fast period.
     */
    public func fastPeriod(period: Double) -> anychart.core.stock.indicators.CHO {
        APIlib.sharedInstance.jsDelegate?.jsAddLine(jsLine: "\(self.jsBase).fastPeriod(\(period));")

        return self
    }
    /**
     * Getter for the indicator smoothing type.
     */
    public func maType()  {
        APIlib.sharedInstance.jsDelegate?.jsAddLine(jsLine: self.jsBase + ".maType();")
    }
    /**
     * Setter for the indicator smoothing type.
     */
    public func maType(type: anychart.enums.MovingAverageType) -> anychart.core.stock.indicators.CHO {
        APIlib.sharedInstance.jsDelegate?.jsAddLine(jsLine: "\(self.jsBase).maType(\((type != nil) ? type.getJsBase() : "null"));")

        return self
    }
    /**
     * Setter for the indicator smoothing type.
     */
    public func maType(type: String) -> anychart.core.stock.indicators.CHO {
        APIlib.sharedInstance.jsDelegate?.jsAddLine(jsLine: "\(self.jsBase).maType(\(JsObject.wrapQuotes(value: type)));")

        return self
    }
    /**
     * Getter for the indicator series instance.
     */
    public func series() -> anychart.core.stock.series.Base {
        return anychart.core.stock.series.Base(jsBase: self.jsBase + ".series()")
    }
    /**
     * Setter for the indicator series type.
     */
    public func series(type: anychart.enums.StockSeriesType) -> anychart.core.stock.indicators.CHO {
        APIlib.sharedInstance.jsDelegate?.jsAddLine(jsLine: "\(self.jsBase).series(\((type != nil) ? type.getJsBase() : "null"));")

        return self
    }
    /**
     * Setter for the indicator series type.
     */
    public func series(type: String) -> anychart.core.stock.indicators.CHO {
        APIlib.sharedInstance.jsDelegate?.jsAddLine(jsLine: "\(self.jsBase).series(\(JsObject.wrapQuotes(value: type)));")

        return self
    }
    /**
     * Getter for the slow period.
     */
    public func slowPeriod()  {
        APIlib.sharedInstance.jsDelegate?.jsAddLine(jsLine: self.jsBase + ".slowPeriod();")
    }
    /**
     * Setter for the slow period.
     */
    public func slowPeriod(period: Double) -> anychart.core.stock.indicators.CHO {
        APIlib.sharedInstance.jsDelegate?.jsAddLine(jsLine: "\(self.jsBase).slowPeriod(\(period));")

        return self
    }

    }
}