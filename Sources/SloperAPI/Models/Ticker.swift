//
//  File.swift
//  
//
//  Created by Sam Friedman on 2/11/24.
//

import Foundation

public struct SearchTickersResponse: Decodable {
    
    public let ticker: [Ticker]?
    
    enum CodingKeys: CodingKey {
        case ticker
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        ticker = try? container.decodeIfPresent([Ticker].self, forKey: .ticker)
    }
    
}

public struct Ticker: Codable, Identifiable, Hashable, Equatable {
    
    public let id = UUID()
    
    public let symbol: String
    public let quoteType: String?
    public let shortName: String?
    public let longName: String?
    public let sector: String?
    public let industry: String?
    public let exchangeName: String?
    
    public init(symbol: String, quoteType: String?, shortName: String?, longName: String?, sector: String?, industry: String?, exchangeName: String?) {
        self.symbol = symbol
        self.quoteType = quoteType
        self.shortName = shortName
        self.longName = longName
        self.sector = sector
        self.industry = industry
        self.exchangeName = exchangeName
    }
    
}
