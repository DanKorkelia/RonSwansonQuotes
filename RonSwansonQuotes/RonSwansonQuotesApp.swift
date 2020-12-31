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
    let dataModel = RandomQuotesViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(dataModel)
        }
    }
}
