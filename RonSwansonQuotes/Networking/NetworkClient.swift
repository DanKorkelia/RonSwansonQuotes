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
            
            guard let response = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    completion(nil, .noResponse)
                }
                return
            }
            
            guard response.statusCode == 200 else {
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
}
