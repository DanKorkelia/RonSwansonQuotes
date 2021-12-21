//
//  QuotesDataProviderTests.swift
//  RonSwansonQuotesTests
//
//  Created by Dan Korkelia on 30/12/2020.
//  Copyright © 2020 Dan Korkelia. All rights reserved.
//

import XCTest
@testable import RonSwansonQuotes

final class QuotesDataProviderTests: XCTestCase {
    private var sut: QuotesDataProvider!
    private var mockParser: MockDataParser!
    
    override func setUp() {
        super.setUp()
        mockParser = MockDataParser()
        sut = QuotesDataProvider(networkDataParser: mockParser)
    }
    
    override func tearDown() {
        mockParser = nil
        sut = nil
        super.tearDown()
    }
    
    func test_expectValueIsSeen_whenDataParserHasSuccessResult() {
        // GIVEN
        mockParser.isSuccessful = true
        
        // WHEN
        var expectedValue: [String]?
        sut.fetchQuotes(defaultValue: ["DummyDefault"]) { result in
            expectedValue = result
        }
        
        // THEN
        XCTAssertEqual(expectedValue?.first, "SuccessResult1")
        XCTAssertEqual(expectedValue?.count, 2)
    }
    
    func test_defaultValueIsReturned_whenDataParserReturnsNoValue() {
        // GIVEN
        mockParser.isSuccessful = false
        
        // WHEN
        var expectedValue: [String]?
        sut.fetchQuotes(defaultValue: ["DummyDefault"]) { result in
            expectedValue = result
        }
        
        // THEN
        XCTAssertEqual(expectedValue?.first, "DummyDefault")
        XCTAssertEqual(expectedValue?.count, 1)
    }
    
    // MARK: - Async Tests
    func test_givenParserIsSuccessful_thenCorrectResultIsReturned() async {
        // GIVEN
        mockParser.isSuccessful = true
        
        // WHEN
        let expectedValue = await sut.fetchQuotes(defaultValue: ["DummyDefault"])
        
        // THEN
        XCTAssertEqual(expectedValue.first, "SuccessResult1")
        XCTAssertEqual(expectedValue.count, 2)
    }

    func test_givenParserReturnsError_thenDefaultResultIsReturned() async {
        // GIVEN
        mockParser.isSuccessful = false

        // WHEN
        let expectedValue = await sut.fetchQuotes(defaultValue: ["DummyDefault"])
        
        // THEN
        XCTAssertEqual(expectedValue.first, "DummyDefault")
        XCTAssertEqual(expectedValue.count, 1)
    }

    // MARK: - Private
    private class MockDataParser: DataParserProtocol {
        var isSuccessful: Bool = true
        
        func fetch<T>(
            _ url: URL,
            defaultValue: T,
            completion: @escaping (Result<T, NetworkError>) -> Void
        ) where T : Decodable {
            if isSuccessful {
                completion(.success(["SuccessResult1", "SuccessResult2"] as! T))
            } else {
                completion(.failure(.invalid))
            }
        }
        
        func fetchAsync<T: Decodable>(_ url: URL) async throws -> T {
            guard isSuccessful else {
                throw NetworkError.invalid
            }
           
            return (["SuccessResult1", "SuccessResult2"] as! T)
        }
    }
}
