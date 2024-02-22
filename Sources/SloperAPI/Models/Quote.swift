//
//  File.swift
//  
//
//  Created by Sam Friedman on 2/9/24.
//

import Foundation

public struct QuoteResponse: Decodable {
    
    public let quote: [Quote]?
    
    enum CodingKeys: CodingKey {
        case quote
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.quote = try?
        container.decodeIfPresent([Quote].self, forKey: .quote)
        
    }
}

public struct Quote: Codable, Identifiable, Hashable {
    
    public let id = UUID()
    
    public let symbol: String
    public let currency: String?
    public let fullExchangeName: String?
    public let displayName: String?
    public let regularMarketPrice: Double?
    public let regularMarketPreviousClose: Double?
    public let regularMarketTime: Date?
    public let regularMarketOpen: Double?
    public let regularMarketDayHigh: Double?
    public let regularMarketDayLow: Double?
    public let regularMarketVolume: Int?
    public let trailingPE: Double?
    public let marketCap: Double?
    public let fiftyTwoWeekLow: Double?
    public let fiftyTwoWeekHigh: Double?
    public let averageVolume: Int?
    public let trailingAnnualDividendYield: Double?
    public let trailingEps: Double?
    public let regularMarketChange: Double?
    public let regularMarketChangePercent: Double?
    public let regularMarketChangePreviousClose: Double?
    public let beta: Double?
    public let yield: Double?
    
    public init(symbol: String, currency: String?=nil, fullExchangeName: String?=nil, displayName: String?=nil, regularMarketPrice: Double?=nil, regularMarketChange: Double?=nil, regularMarketChangePercent: Double?=nil, regularMarketChangePreviousClose: Double?=nil, regularMarketPreviousClose: Double?=nil, regularMarketTime: Date?=nil, regularMarketOpen: Double?=nil, regularMarketDayHigh: Double?=nil, regularMarketDayLow: Double?=nil, regularMarketVolume: Int?=nil, trailingPE: Double?=nil, marketCap: Double?=nil, fiftyTwoWeekLow: Double?=nil, fiftyTwoWeekHigh: Double?=nil, averageVolume: Int?=nil, trailingAnnualDividendYield: Double?=nil, trailingEps: Double?=nil, beta: Double?=nil, yield: Double?=nil) {
        self.symbol = symbol
        self.currency = currency
        self.fullExchangeName = fullExchangeName
        self.displayName = displayName
        self.regularMarketPrice = regularMarketPrice
        self.regularMarketChange = regularMarketChange
        self.regularMarketChangePercent = regularMarketChangePercent
        self.regularMarketChangePreviousClose = regularMarketChangePreviousClose
        self.regularMarketPreviousClose = regularMarketPreviousClose
        self.regularMarketTime = regularMarketTime
        self.regularMarketOpen = regularMarketOpen
        self.regularMarketDayHigh = regularMarketDayHigh
        self.regularMarketDayLow = regularMarketDayLow
        self.regularMarketVolume = regularMarketVolume
        self.trailingPE = trailingPE
        self.marketCap = marketCap
        self.fiftyTwoWeekLow = fiftyTwoWeekLow
        self.fiftyTwoWeekHigh = fiftyTwoWeekHigh
        self.averageVolume = averageVolume
        self.trailingAnnualDividendYield = trailingAnnualDividendYield
        self.trailingEps = trailingEps
        self.beta = beta
        self.yield = yield

        
    }

    
}
