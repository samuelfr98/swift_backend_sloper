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
    
    public let symbol: String?
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
    
    public init(symbol: String?, currency: String?, fullExchangeName: String?, displayName: String?, regularMarketPrice: Double?, regularMarketPreviousClose: Double?, regularMarketTime: Date?, regularMarketOpen: Double?, regularMarketDayHigh: Double?, regularMarketDayLow: Double?, regularMarketVolume: Int?, trailingPE: Double?, marketCap: Double?, fiftyTwoWeekLow: Double?, fiftyTwoWeekHigh: Double?, averageVolume: Int?, trailingAnnualDividendYield: Double?, trailingEps: Double?) {
        self.symbol = symbol
        self.currency = currency
        self.fullExchangeName = fullExchangeName
        self.displayName = displayName
        self.regularMarketPrice = regularMarketPrice
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
    }

    
}
