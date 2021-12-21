//
//  DataParserTests.swift
//  RonSwansonQuotesTests
//
//  Created by Dan Korkelia on 30/12/2020.
//  Copyright © 2020 Dan Korkelia. All rights reserved.
//

import XCTest
@testable import RonSwansonQuotes

final class DataParserTests: XCTestCase {
    private var sut: DataParser!
    private var mockNetworkClient: MockNetworkClient!
    
    override func tearDown() {
        sut = nil
        mockNetworkClient = nil
        super.tearDown()
    }
    
    func test_parserReturnsInvalidError_whenDataIsInInvalidFormat() {
        // GIVEN
        let invalidJson = "Invalid".data(using: .utf8)!
        mockNetworkClient = MockNetworkClient(data: invalidJson, error: nil)
        sut = DataParser(networkClient: mockNetworkClient)
        
        // WHEN
        var expectedResult: Result<String, NetworkError>?
        sut.fetch(URL("https://example.com"), defaultValue: "dummy") { result in
            expectedResult = result
        }
        
        // THEN
        XCTAssertEqual(expectedResult, .failure(.invalid))
    }
    
    func test_parserReturnsDefaultValue_whenDataIsNil() {
        // GIVEN
        mockNetworkClient = MockNetworkClient(data: nil, error: nil)
        sut = DataParser(networkClient: mockNetworkClient)
        
        // WHEN
        var expectedResult: Result<String, NetworkError>?
        sut.fetch(URL("https://example.com"), defaultValue: "Default Result") { result in
            expectedResult = result
        }
        
        // THEN
        XCTAssertEqual(expectedResult, .success("Default Result"))
    }
    
    func test_parserReturnsSuccessWithCorrectValue() {
        // GIVEN
        let encoder = JSONEncoder()
        let string = "[0, 1, 2]"
        let data = try! encoder.encode(string)
        
        mockNetworkClient = MockNetworkClient(data: data, error: nil)
        sut = DataParser(networkClient: mockNetworkClient)
        
        // WHEN
        var expectedResult: Result<String, NetworkError>?
        sut.fetch(URL("https://example.com/found.json"), defaultValue: "empty") { result in
            expectedResult = result
        }
        
        // THEN
        XCTAssertEqual(expectedResult, .success("[0, 1, 2]"))
    }
    
    private class MockNetworkClient: NetworkClientProtocol {        
        private var error: NetworkError? = nil
        private var data: Data? = nil
        
        init(data: Data?, error: NetworkError?) {
            self.data = data
            self.error = error
        }
        
        func request(_ payload: NetworkRequest, completion: @escaping (Data?, NetworkError?) -> Void) {
            completion(data, error)
        }
        
        func requestAsync(_ payload: NetworkRequest) async throws -> Data {
            return data!
        }
    }
}
