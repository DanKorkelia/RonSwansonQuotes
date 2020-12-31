//
//  DataParser.swift
//  RonSwansonQuotes
//
//  Created by Dan Korkelia on 30/12/2020.
//  Copyright © 2020 Dan Korkelia. All rights reserved.
//

import Foundation

final class DataParser: DataParserProtocol {
    
    private let networkClient: NetworkClientProtocol
    
    init(networkClient: NetworkClientProtocol = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    /// Fetch data from provided URL
    /// - Parameters:
    ///   - url: url to fetch data from
    ///   - defaultValue: sets type of data to fetch as well as providing safe default for case when no data is available from endpoint.
    ///   - completion: call completion to return result
    
    func fetch<T: Decodable>(_ url: URL, defaultValue: T, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        let getRequest = NetworkRequest(url: url)
        networkClient.request(getRequest) { data, error in
            let decoder = JSONDecoder()
            
            guard let data = data else {
                completion(.success(defaultValue))
                return
            }

            do {
                let payload = try decoder.decode(T.self, from: data)
                completion(.success(payload))
            }
            catch {
                completion(.failure(.invalid))
            }
        }
    }
}

protocol DataParserProtocol {
    func fetch<T: Decodable>(_ url: URL, defaultValue: T, completion: @escaping (Result<T, NetworkError>) -> Void)
}
