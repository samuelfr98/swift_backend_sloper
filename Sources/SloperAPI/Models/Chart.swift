//
//  File.swift
//  
//
//  Created by Sam Friedman on 2/9/24.
//

import Foundation

public struct ChartResponse: Decodable {
    
    public let chartResponse: ChartData
    
    enum CodingKeys: CodingKey {
        case chartResponse
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.chartResponse = try container.decode(ChartData.self, forKey: .chartResponse)
    }
}

public struct ChartData: Decodable {
    
    public let meta: ChartMeta
    public let indicators: [Indicator]
    
    enum CodingKeys: CodingKey {
        case meta
        case indicators
    }
    
    enum IndicatorKeys: CodingKey {
        case Datetime   // If requesting where interval < 1d
        case Date       // If requesting where interval >= 1d
        case High
        case Low
        case Close
        case Open
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        meta = try container.decode(ChartMeta.self, forKey: .meta)
        indicators = try container.decode([Indicator].self, forKey: .indicators)
    }
    
    public init(meta: ChartMeta, indicators: [Indicator]) {
        self.meta = meta
        self.indicators = indicators
    }
}


public struct ChartMeta: Decodable {
    
    public let currency: String
    public let symbol: String
    public let regularMarketPrice: Double?
    public let previousClose: Double?
    public let gmtOffSetMilliseconds: Int
    public let regularTradingPeriodStartDate: Date
    public let regularTradingPeriodEndDate: Date
    
    enum CodingKeys: CodingKey {
        case currency
        case symbol
        case regularMarketPrice
        case previousClose
        case gmtOffSetMilliseconds
        case regularTradingPeriodStartDate
        case regularTradingPeriodEndDate
    }
    
    
    
    public init(currency: String, symbol: String, regularMarketPrice: Double?, previousClose: Double?, gmtOffSetMilliseconds: Int, regularTradingPeriodStartDate: Date, regularTradingPeriodEndDate: Date) {
        self.currency = currency
        self.symbol = symbol
        self.regularMarketPrice = regularMarketPrice
        self.previousClose = previousClose
        self.gmtOffSetMilliseconds = gmtOffSetMilliseconds
        self.regularTradingPeriodStartDate = regularTradingPeriodStartDate
        self.regularTradingPeriodEndDate = regularTradingPeriodEndDate
    }
    
    
    
}

public struct Indicator: Decodable {
    
    public let Datetime: String?
    public let Date: String?
    public let Open: Double
    public let Close: Double
    public let High: Double
    public let Low: Double
    public let Volume: Int
    
    public init(Datetime: String, Date: String, Open: Double, Close: Double, High: Double, Low: Double, Volume: Int) {
        self.Datetime = Datetime
        self.Date = Date
        self.Open = Open
        self.Close = Close
        self.High = High
        self.Low = Low
        self.Volume = Volume
    }
    
}
