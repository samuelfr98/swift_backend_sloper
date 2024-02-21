// The Swift Programming Language
// https://docs.swift.org/swift-book

// https://www.youtube.com/watch?v=twhgYBrepSo&list=PLuecTl5TrGwtQRtT6wxI0-l0fN-2V5QTJ&index=2 ~1:53:00 timestamp in tutorial video
// https://github.com/alfianlosari/XCAStocksAPI/blob/main/Sources/XCAStocksAPI/XCAStocksAPI.swift example project 


import Foundation

public protocol SloperAPIProtocol {
    func fetchChartReponse(ticker: String, range: ChartRange) async throws -> ChartData?
    func fetchTickers(tickers: String) async throws -> [Ticker]
    func fetchQuotes(tickers: String) async throws -> [Quote]
}

public struct SloperAPI: SloperAPIProtocol {
    
    private let session = URLSession.shared
    
    private let jsonDecoder = {
let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }()

    // Local development API URL
    private let baseURL = "http://127.0.0.1:8000"
    
    public init(){}
    
    
    public func fetchChartReponse(ticker: String, range: ChartRange) async throws -> ChartData? {
        // Contruct URL
        guard var urlComponents = URLComponents(string: "\(baseURL)/getChartResponse/") else {
            throw APIServiceError.invalidURL
        }
        urlComponents.queryItems = [
            .init(name: "ticker", value: ticker),
            .init(name: "period", value: range.rawValue),
            .init(name: "interval", value: range.interval)
        ]
        guard let url = urlComponents.url else {
            throw APIServiceError.invalidURL
        }
        // Call API
        let (response, statusCode): (ChartResponse, Int) = try await fetch(url: url)
        if (statusCode != 200) {
            throw APIServiceError.httpStatusCodeFailed(statusCode: statusCode, error: nil)
        }
        
        return response.chartResponse
    }
    
    
    public func fetchTickers(tickers: String) async throws -> [Ticker] {
        // Contruct URL
        guard var urlComponents = URLComponents(string: "\(baseURL)/getTicker/") else {
            throw APIServiceError.invalidURL
        }
        urlComponents.queryItems = [.init(name: "ticker", value: tickers)]
        guard let url = urlComponents.url else {
            throw APIServiceError.invalidURL
        }
        // Call API
        let (response, statusCode): (SearchTickersResponse, Int) = try await fetch(url: url)
        if (statusCode != 200) {
            throw APIServiceError.httpStatusCodeFailed(statusCode: statusCode, error: nil)
        }
        
        return response.ticker ?? []
    }
    
    public func fetchQuotes(tickers: String) async throws -> [Quote] {
        // Contruct URL
        guard var urlComponents = URLComponents(string: "\(baseURL)/getQuote/") else {
            throw APIServiceError.invalidURL
        }
        urlComponents.queryItems = [.init(name: "ticker", value: tickers)]
        guard let url = urlComponents.url else {
            throw APIServiceError.invalidURL
        }
        // Call API
        let (response, statusCode): (QuoteResponse, Int) = try await fetch(url: url)
        if (statusCode != 200) {
            throw APIServiceError.httpStatusCodeFailed(statusCode: statusCode, error: nil)
        }
        
        return response.quote ?? []
    }
    
    private func fetch<D: Decodable>(url: URL) async throws -> (D, Int) {
        let (data, response) = try await session.data(from: url)
        let statusCode = try validateHTTPResponse(response: response)
        return (try jsonDecoder.decode(D.self, from: data), statusCode)
    }
    
    private func validateHTTPResponse(response: URLResponse) throws -> Int {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIServiceError.invalidResponseType
        }
        guard 200...299 ~= httpResponse.statusCode ||
              400...499 ~= httpResponse.statusCode
        else {
            throw APIServiceError.httpStatusCodeFailed(statusCode: httpResponse.statusCode, error: nil)
        }
        
        return httpResponse.statusCode
    }
    
}
