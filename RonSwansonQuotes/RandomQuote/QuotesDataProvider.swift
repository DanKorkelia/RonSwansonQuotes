//
//  QuotesDataProvider.swift
//  RonSwansonQuotes
//
//  Created by Dan Korkelia on 30/12/2020.
//

import Foundation

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
}
