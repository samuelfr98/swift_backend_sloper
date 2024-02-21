//
//  File.swift
//  
//
//  Created by Sam Friedman on 2/9/24.
//

import Foundation
import SloperAPI

@main
struct SloperAPIExec {
    
    static let sloperAPI = SloperAPI()
    
    static func main () async {
        
        do {
            // Fetch MSFT and AAPL Quote details
//            let quotes = try await sloperAPI
//                .fetchQuotes(tickers: "MSFT AAPL")
//            print(quotes)
            
//            // Fetch MSFT and AAPL ticker data
//            let tickers = try await sloperAPI
//                .fetchTickers(tickers: "MSFT AAPL")
//            print(tickers)
//            
//            // Fetch last day day of MSFT stock data at minutely intervals
            let chartData = try await sloperAPI
                .fetchChartReponse(ticker: "MSFT", range: .oneDay)
            print(chartData)
        } catch {
            print(error.localizedDescription)
        }
    }
}
