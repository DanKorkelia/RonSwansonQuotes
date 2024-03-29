//
//  QuotesDataProvider.swift
//  RonSwansonQuotes
//
//  Created by Dan Korkelia on 30/12/2020.
//  Copyright © 2020 Dan Korkelia. All rights reserved.
//

import Foundation
import NetworkingClient

final class QuotesDataProvider: QuotesDataProvidable {
    private let networkDataParser: DataParserProtocol
    
    init(networkDataParser: DataParserProtocol = DataParser() ) {
        self.networkDataParser = networkDataParser
    }
    
    func fetchQuotes(count: Int = 1, defaultValue: [String], completion: @escaping ([String]) -> Void) {
        
        var url = URL("https://ron-swanson-quotes.herokuapp.com/v2/quotes")
        url.appendPathComponent("\(count)")
        
        networkDataParser.fetch(url, defaultValue: defaultValue) { result in
            
            switch result {
            case .success(let result):
                completion(result)
            case .failure:
                completion(defaultValue)
            }
        }
    }
    
    func fetchQuotes(count: Int = 1, defaultValue: [String]) async -> [String] {
        var url = URL("https://ron-swanson-quotes.herokuapp.com/v2/quotes")
        url.appendPathComponent("\(count)")
        
        do {
            return try await networkDataParser.fetchAsync(url)
        } catch {
            return defaultValue
        }
    }
}

#if DEBUG
final class MockQuotesDataProvider: QuotesDataProvidable {
    var dummyValue = [String]()
    
    func fetchQuotes(count: Int, defaultValue: [String], completion: @escaping ([String]) -> Void) {
        completion(dummyValue)
    }
    
    func fetchQuotes(count: Int, defaultValue: [String]) async -> [String] {
        return dummyValue
    }
}
#endif
