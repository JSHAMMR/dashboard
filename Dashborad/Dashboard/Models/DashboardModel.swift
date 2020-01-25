//
//  DashboardModel.swift
//  Dashborad
//
//  Created by Gamil Ali Qaid Shamar on 25/01/2020.
//  Copyright © 2020 Jamil. All rights reserved.
//


import Foundation

// MARK: - DashboardModel
class DashboardModel: Codable {
    var httpStatus: Int?
    var response: Response?

    init(httpStatus: Int?, response: Response?) {
        self.httpStatus = httpStatus
        self.response = response
    }
}

// MARK: DashboardModel convenience initializers and mutators

extension DashboardModel {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(DashboardModel.self, from: data)
        self.init(httpStatus: me.httpStatus, response: me.response)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        httpStatus: Int?? = nil,
        response: Response?? = nil
    ) -> DashboardModel {
        return DashboardModel(
            httpStatus: httpStatus ?? self.httpStatus,
            response: response ?? self.response
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Response
class Response: Codable {
    var message: String?
    var data: DataClass?

    init(message: String?, data: DataClass?) {
        self.message = message
        self.data = data
    }
}

// MARK: Response convenience initializers and mutators

extension Response {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Response.self, from: data)
        self.init(message: me.message, data: me.data)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        message: String?? = nil,
        data: DataClass?? = nil
    ) -> Response {
        return Response(
            message: message ?? self.message,
            data: data ?? self.data
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - DataClass
class DataClass: Codable {
    var analytics: Analytics?

    init(analytics: Analytics?) {
        self.analytics = analytics
    }
}

// MARK: DataClass convenience initializers and mutators

extension DataClass {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(DataClass.self, from: data)
        self.init(analytics: me.analytics)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        analytics: Analytics?? = nil
    ) -> DataClass {
        return DataClass(
            analytics: analytics ?? self.analytics
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Analytics
class Analytics: Codable {
    var job: Job?
    var lineCharts: [[LineChart]]?
    var pieCharts: [PieChart]?
    var rating: Rating?
    var service: Job?

    init(job: Job?, lineCharts: [[LineChart]]?, pieCharts: [PieChart]?, rating: Rating?, service: Job?) {
        self.job = job
        self.lineCharts = lineCharts
        self.pieCharts = pieCharts
        self.rating = rating
        self.service = service
    }
}

// MARK: Analytics convenience initializers and mutators

extension Analytics {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Analytics.self, from: data)
        self.init(job: me.job, lineCharts: me.lineCharts, pieCharts: me.pieCharts, rating: me.rating, service: me.service)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        job: Job?? = nil,
        lineCharts: [[LineChart]]?? = nil,
        pieCharts: [PieChart]?? = nil,
        rating: Rating?? = nil,
        service: Job?? = nil
    ) -> Analytics {
        return Analytics(
            job: job ?? self.job,
            lineCharts: lineCharts ?? self.lineCharts,
            pieCharts: pieCharts ?? self.pieCharts,
            rating: rating ?? self.rating,
            service: service ?? self.service
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Job
class Job: Codable {
    var jobDescription: String?
    var items: [JobItem]?
    var title: String?

    enum CodingKeys: String, CodingKey {
        case jobDescription = "description"
        case items, title
    }

    init(jobDescription: String?, items: [JobItem]?, title: String?) {
        self.jobDescription = jobDescription
        self.items = items
        self.title = title
    }
}

// MARK: Job convenience initializers and mutators

extension Job {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Job.self, from: data)
        self.init(jobDescription: me.jobDescription, items: me.items, title: me.title)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        jobDescription: String?? = nil,
        items: [JobItem]?? = nil,
        title: String?? = nil
    ) -> Job {
        return Job(
            jobDescription: jobDescription ?? self.jobDescription,
            items: items ?? self.items,
            title: title ?? self.title
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - JobItem
public class JobItem: Codable {
    var itemDescription: String?
    var growth: Int?
    var title: String?
    var total: Int?
    var avg: String?

    enum CodingKeys: String, CodingKey {
        case itemDescription = "description"
        case growth, title, total, avg
    }

    init(itemDescription: String?, growth: Int?, title: String?, total: Int?, avg: String?) {
        self.itemDescription = itemDescription
        self.growth = growth
        self.title = title
        self.total = total
        self.avg = avg
    }
}

// MARK: JobItem convenience initializers and mutators

extension JobItem {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(JobItem.self, from: data)
        self.init(itemDescription: me.itemDescription, growth: me.growth, title: me.title, total: me.total, avg: me.avg)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        itemDescription: String?? = nil,
        growth: Int?? = nil,
        title: String?? = nil,
        total: Int?? = nil,
        avg: String?? = nil
    ) -> JobItem {
        return JobItem(
            itemDescription: itemDescription ?? self.itemDescription,
            growth: growth ?? self.growth,
            title: title ?? self.title,
            total: total ?? self.total,
            avg: avg ?? self.avg
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - LineChart
public class LineChart: Codable {
    var chartType, lineChartDescription: String?
    var items: [LineChartItem]?
    var title: String?

    enum CodingKeys: String, CodingKey {
        case chartType
        case lineChartDescription = "description"
        case items, title
    }

    init(chartType: String?, lineChartDescription: String?, items: [LineChartItem]?, title: String?) {
        self.chartType = chartType
        self.lineChartDescription = lineChartDescription
        self.items = items
        self.title = title
    }
}

// MARK: LineChart convenience initializers and mutators

extension LineChart {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(LineChart.self, from: data)
        self.init(chartType: me.chartType, lineChartDescription: me.lineChartDescription, items: me.items, title: me.title)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        chartType: String?? = nil,
        lineChartDescription: String?? = nil,
        items: [LineChartItem]?? = nil,
        title: String?? = nil
    ) -> LineChart {
        return LineChart(
            chartType: chartType ?? self.chartType,
            lineChartDescription: lineChartDescription ?? self.lineChartDescription,
            items: items ?? self.items,
            title: title ?? self.title
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - LineChartItem
public class LineChartItem: Codable {
    var key: String?
    var value: [ValueElement]?

    init(key: String?, value: [ValueElement]?) {
        self.key = key
        self.value = value
    }
}

// MARK: LineChartItem convenience initializers and mutators

extension LineChartItem {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(LineChartItem.self, from: data)
        self.init(key: me.key, value: me.value)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        key: String?? = nil,
        value: [ValueElement]?? = nil
    ) -> LineChartItem {
        return LineChartItem(
            key: key ?? self.key,
            value: value ?? self.value
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - ValueElement
public class ValueElement: Codable {
    var key: String?
    var value: Double?

    init(key: String?, value: Double?) {
        self.key = key
        self.value = value
    }
}

// MARK: ValueElement convenience initializers and mutators

extension ValueElement {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(ValueElement.self, from: data)
        self.init(key: me.key, value: me.value)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        key: String?? = nil,
        value: Double?? = nil
    ) -> ValueElement {
        return ValueElement(
            key: key ?? self.key,
            value: value ?? self.value
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - PieChart
public class PieChart: Codable {
    var chartType, pieChartDescription: String?
    var items: [ValueElement]?
    var title: String?

    enum CodingKeys: String, CodingKey {
        case chartType
        case pieChartDescription = "description"
        case items, title
    }

    init(chartType: String?, pieChartDescription: String?, items: [ValueElement]?, title: String?) {
        self.chartType = chartType
        self.pieChartDescription = pieChartDescription
        self.items = items
        self.title = title
    }
}

// MARK: PieChart convenience initializers and mutators

extension PieChart {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(PieChart.self, from: data)
        self.init(chartType: me.chartType, pieChartDescription: me.pieChartDescription, items: me.items, title: me.title)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        chartType: String?? = nil,
        pieChartDescription: String?? = nil,
        items: [ValueElement]?? = nil,
        title: String?? = nil
    ) -> PieChart {
        return PieChart(
            chartType: chartType ?? self.chartType,
            pieChartDescription: pieChartDescription ?? self.pieChartDescription,
            items: items ?? self.items,
            title: title ?? self.title
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Rating
public class Rating: Codable {
    var avg: Int?
    var ratingDescription: String?
    var items: Items?
    var title: String?

    enum CodingKeys: String, CodingKey {
        case avg
        case ratingDescription = "description"
        case items, title
    }

    init(avg: Int?, ratingDescription: String?, items: Items?, title: String?) {
        self.avg = avg
        self.ratingDescription = ratingDescription
        self.items = items
        self.title = title
    }
    
    init() {
           self.avg = 0
           self.ratingDescription = ""
           self.items = nil
           self.title = ""
       }
       
    
}

// MARK: Rating convenience initializers and mutators

extension Rating {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Rating.self, from: data)
        self.init(avg: me.avg, ratingDescription: me.ratingDescription, items: me.items, title: me.title)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        avg: Int?? = nil,
        ratingDescription: String?? = nil,
        items: Items?? = nil,
        title: String?? = nil
    ) -> Rating {
        return Rating(
            avg: avg ?? self.avg,
            ratingDescription: ratingDescription ?? self.ratingDescription,
            items: items ?? self.items,
            title: title ?? self.title
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Items
class Items: Codable {
    var the1, the2, the3, the4: Int?
    var the5: Int?

    enum CodingKeys: String, CodingKey {
        case the1 = "1"
        case the2 = "2"
        case the3 = "3"
        case the4 = "4"
        case the5 = "5"
    }

    init(the1: Int?, the2: Int?, the3: Int?, the4: Int?, the5: Int?) {
        self.the1 = the1
        self.the2 = the2
        self.the3 = the3
        self.the4 = the4
        self.the5 = the5
    }
}

// MARK: Items convenience initializers and mutators

extension Items {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Items.self, from: data)
        self.init(the1: me.the1, the2: me.the2, the3: me.the3, the4: me.the4, the5: me.the5)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        the1: Int?? = nil,
        the2: Int?? = nil,
        the3: Int?? = nil,
        the4: Int?? = nil,
        the5: Int?? = nil
    ) -> Items {
        return Items(
            the1: the1 ?? self.the1,
            the2: the2 ?? self.the2,
            the3: the3 ?? self.the3,
            the4: the4 ?? self.the4,
            the5: the5 ?? self.the5
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

