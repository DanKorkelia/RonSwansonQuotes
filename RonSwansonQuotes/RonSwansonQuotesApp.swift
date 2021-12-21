//
//  RonSwansonQuotesApp.swift
//  RonSwansonQuotes
//
//  Created by Dan Korkelia on 30/12/2020.
//  Copyright © 2020 Dan Korkelia. All rights reserved.
//

import SwiftUI

@main
struct RonSwansonQuotesApp: App {
    
    /// Present here to swap out data provider with a mock version
    /// that does not reach out to real network. And is used in UI Tests.
    static let dataProvider: QuotesDataProvidable = {
        if ProcessInfo.processInfo.arguments.contains("ui-tests") {
            let dataProvider = MockQuotesDataProvider()
            dataProvider.dummyValue = ["Great Test", "Massive Win"]
            return dataProvider
        } else {
            return QuotesDataProvider()
        }
    }()
    
    let viewModel = RandomQuotesViewModel(
        data: dataProvider,
        userDefaults: .standard
    )

    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(viewModel)
        }
    }
}
