//
//  RonSwansonUITests.swift
//  RonSwansonQuotesUITests
//
//  Created by Dan Korkelia on 30/12/2020.
//  Copyright © 2020 Dan Korkelia. All rights reserved.
//

import XCTest
@testable import RonSwansonQuotes

final class RonSwansonUITests: XCTestCase {
    private let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        // Add launch argment to substitute network with mock data.
    }
    
    func test_basicFlow() {
        // GIVEN
        let navigationBar = app.navigationBars["Quote"]
        let refreshButton = navigationBar.buttons["Refresh"]
        let saveQuoteButton = app.buttons["save_quote"]
        
        // WHEN
        refreshButton.tap()
        saveQuoteButton.tap()
        
        // THEN
        XCTAssertTrue(navigationBar.exists)
        XCTAssert(refreshButton.isHittable)
        XCTAssert(saveQuoteButton.isHittable)
    }
}
