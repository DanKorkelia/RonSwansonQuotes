//
//  NetworkClient.swift
//  RonSwansonQuotes
//
//  Created by Dan Korkelia on 30/12/2020.
//  Copyright © 2020 Dan Korkelia. All rights reserved.
//

import Foundation

// MARK: - URLSession data task
struct NetworkClient: NetworkClientProtocol {
    
    private var sessionConfiguration: URLSessionConfiguration
    
    init(configuration: URLSessionConfiguration = .default) {
        self.sessionConfiguration = configuration
    }
    
    func request(_ payload: NetworkRequest, completion: @escaping (_ success: Data?, _ failure: NetworkError?) -> Void) {
        
        let urlSession = URLSession(configuration: sessionConfiguration)
        var request = URLRequest(url: payload.url, cachePolicy: .useProtocolCachePolicy)
        request.httpMethod = payload.httpMethod.rawValue
        
        let task = urlSession.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            guard
                let response = response as? HTTPURLResponse,
                response.statusCode == 200
            else {
                DispatchQueue.main.async {
                    completion(nil, .invalid)
                }
                return
            }
            
            DispatchQueue.main.async {
                completion(data, nil)
            }
        }
        
        task.resume()
    }
    
    func requestAsync(_ payload: NetworkRequest) async throws -> Data {
        let urlSession = URLSession(configuration: sessionConfiguration)
        let request = URLRequest(url: payload.url, cachePolicy: .useProtocolCachePolicy)
        let (data, response) = try await urlSession.data(for: request)

        guard
            let response = response as? HTTPURLResponse,
            response.statusCode == 200
        else {
            throw NetworkError.invalid
        }

        return data
    }
}
