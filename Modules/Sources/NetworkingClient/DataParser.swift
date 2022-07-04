//
//  DataParser.swift
//  RonSwansonQuotes
//
//  Created by Dan Korkelia on 30/12/2020.
//  Copyright © 2020 Dan Korkelia. All rights reserved.
//

import Foundation

public final class DataParser: DataParserProtocol {
    
    private let networkClient: NetworkClientProtocol
    
    public init(networkClient: NetworkClientProtocol = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    /// Fetch data from provided URL
    /// - Parameters:
    ///   - url: url to fetch data from
    ///   - defaultValue: sets type of data to fetch as well as providing safe default for case when no data is available from endpoint.
    ///   - completion: call completion to return result
    
    public func fetch<T: Decodable>(_ url: URL, defaultValue: T, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
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
    
    public func fetchAsync<T: Decodable>(_ url: URL) async throws -> T {
        let getRequest = NetworkRequest(url: url)
        let decoder = JSONDecoder()
        
        do {
            let data = try await networkClient.requestAsync(getRequest)
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.invalid
        }
    }
}

public protocol DataParserProtocol {
    func fetch<T: Decodable>(_ url: URL, defaultValue: T, completion: @escaping (Result<T, NetworkError>) -> Void)
    func fetchAsync<T: Decodable>(_ url: URL) async throws -> T
}
