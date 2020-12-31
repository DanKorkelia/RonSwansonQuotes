//
//  RandomQuotesViewModelTests.swift
//  RonSwansonQuotesTests
//
//  Created by Dan Korkelia on 31/12/2020.
//

import XCTest
@testable import RonSwansonQuotes

final class RandomQuotesViewModelTests: XCTestCase {
    private var sut: RandomQuotesViewModel!
    private var mockDataProvider: MockQuotesDataProvider!
    private var mockUserDefaults: UserDefaults!
    
    override func setUp() {
        mockUserDefaults = UserDefaults(suiteName: "RandomQuotesViewModelTests")!
        mockDataProvider = MockQuotesDataProvider()
        sut = RandomQuotesViewModel(data: mockDataProvider, userDefaults: mockUserDefaults)
    }
    
    override func tearDown() {
        sut = nil
        mockDataProvider = nil
    }
    
    func test_getQuotesReturnsFallbackValue() {
        // WHEN
        sut.getQuote()
        
        // THEN
        XCTAssertEqual(sut.quote, "There was a problem fetching my quotes")
    }
    
    func test_getQuotesReturnsFirstElementOfAnArrayOfValues() {
        mockDataProvider = MockQuotesDataProvider()
        mockDataProvider.dummyValue = ["Dummy1", "Dummy2", "Dummy3"]
        sut = RandomQuotesViewModel(data: mockDataProvider, userDefaults: mockUserDefaults)
        
        // WHEN
        sut.getQuote()
        
        // THEN
        XCTAssertEqual(sut.quote, "Dummy1")
    }
    
    func test_storeQuoteSavesValueInUserDefaults() throws {
        mockDataProvider = MockQuotesDataProvider()
        mockDataProvider.dummyValue = ["Dummy1", "Dummy2", "Dummy3"]
        sut = RandomQuotesViewModel(data: mockDataProvider, userDefaults: mockUserDefaults)
        
        // WHEN
        sut.getQuote()
        sut.storeCurrentQuoteInFavorites()
        
        // THEN
        
        let expectedValue = try XCTUnwrap( mockUserDefaults.object(forKey: "FavoriteQuotes") as? [String])
        XCTAssertEqual(expectedValue.first, "Dummy1")
    }
    
    // MARK: - Private
    private class MockQuotesDataProvider: QuotesDataProvidable {
        var dummyValue = [String]()
        
        func fetchQuotes(count: Int, defaultValue: [String], completion: @escaping ([String]) -> Void) {
            completion(dummyValue)
        }
    }
}