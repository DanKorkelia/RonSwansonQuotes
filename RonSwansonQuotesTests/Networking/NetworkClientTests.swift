//
//  CombineNetworkProviderTests.swift
//  RonSwansonQuotesTests
//
//  Created by Dan Korkelia on 30/12/2020.
//

import XCTest
@testable import RonSwansonQuotes

final class NetworkClientTests: XCTestCase {
    private let testURL = URL("https://example.com")
    
    func test_Success() {
        // GIVEN
        registerNetworkResult(testURL: testURL, statusCode: .code200, mockData: Data("dummyValue".utf8))
        
        
        let expectation = XCTestExpectation(description: "success")
        defer {
            self.wait(for: [expectation], timeout: 3)
        }
        
        // WHEN
        let client = createMockedClientSession()
        
        client.request(.init(url: testURL)) { (data: Data?, error: NetworkError?) in
            defer {
                expectation.fulfill()
            }
            
            // THEN
            XCTAssertNil(error, "Error not expected")
            XCTAssertNotNil(data, "Data expected")
            XCTAssertEqual(data, "dummyValue".data(using: .utf8)!)
        }
    }
    
    func test_requestFailedReturnsInvalid_whenEndpointReturnsError404() {
        // GIVEN
        registerNetworkResult(testURL: testURL, statusCode: .code404, mockData: Data())
        
        let expectation = XCTestExpectation(description: "failure")
        defer {
            self.wait(for: [expectation], timeout: 3)
        }
        
        // WHEN
        let client = createMockedClientSession()
        client.request(.init(url: testURL)) { (data: Data?, error: NetworkError?) in
            defer {
                expectation.fulfill()
            }
            
            // THEN
            XCTAssertEqual(error, .invalid)
            XCTAssertNotNil(error, "Error expected")
            XCTAssertNil(data, "Nil is expected for data")
        }
    }
    
    // MARK: - Private
    private func createMockedClientSession() -> NetworkClient {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [ MockURLProtocol.self ]
        return NetworkClient(configuration: config)
    }
    
    private enum MockStatusCode: Int {
        case code404 = 404
        case code200 = 200
    }
    
    private func registerNetworkResult(testURL: URL, statusCode: MockStatusCode, mockData: Data) {
        
        MockURLProtocol.handler = { request in
            let response = HTTPURLResponse(url: request.url!,
                                           statusCode: statusCode.rawValue,
                                           httpVersion: nil,
                                           headerFields: nil)!
            return (response, mockData)
        }
        
    }
}
