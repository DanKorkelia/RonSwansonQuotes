//
//  RonSwansonQuotesApp.swift
//  RonSwansonQuotes
//
//  Created by Dan Korkelia on 30/12/2020.
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
