//
//  NetworkRequest.swift
//  RonSwansonQuotes
//
//  Created by Dan Korkelia on 30/12/2020.
//

import Foundation

/// Provides Mocked version of URLProtocol which allows unit tests to be performed on network layer 'network client'.
/// There are no real network calls being made but result is stored in memory for duration of a unit test.

final class MockURLProtocol: URLProtocol {
    static var handler: ((URLRequest) throws -> (HTTPURLResponse, Data))?
    static var error: Error?
    
    // Return true to allow handling all types of requests
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }
    
    override func startLoading() {
        
        if let error = MockURLProtocol.error {
            client?.urlProtocol(self, didFailWithError: error)
            return
        }
        
        guard
            let handler = MockURLProtocol.handler else {
            assertionFailure("This should not happen if request was provided")
            return
        }
        
        do {
            let (response, data) = try handler(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
    
    override func stopLoading() {}
}
