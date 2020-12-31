//
//  RonSwansonUITests.swift
//  RonSwansonQuotesUITests
//
//  Created by Dan Korkelia on 30/12/2020.
//

import XCTest
@testable import RonSwansonQuotes

final class RonSwansonUITests: XCTestCase {
    private let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func test_dummy() {
        // GIVEN
        let navigationBar = app.navigationBars["Quote"]
        let refreshButton = navigationBar.buttons["refresh"]
        let saveQuoteButton = app.buttons["heart"]
        
        // THEN
        refreshButton.tap()
        saveQuoteButton.tap()
        
        XCTAssertTrue(navigationBar.exists)
        XCTAssert(refreshButton.isHittable)
        XCTAssert(saveQuoteButton.isHittable)
    }
}
