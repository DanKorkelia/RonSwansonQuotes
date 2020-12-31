//
//  TabBarView.swift
//  RonSwansonQuotes
//
//  Created by Dan Korkelia on 30/12/2020.
//

import SwiftUI

struct TabBarView: View {
    @SceneStorage("selectedView")
    var selectedView: String?
    
    var body: some View {
        TabView(selection: $selectedView) {
            RandomQuoteView()
                .tag(RandomQuoteView.tag)
                .tabItem {
                    Image(systemName: "quote.bubble.fill")
                    Text("Quote")
                }
            
            FavouriteQuoteView()
                .tag(FavouriteQuoteView.tag)
                .tabItem {
                    Image(systemName: "heart.circle.fill")
                    Text("Favourite")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .environmentObject(RandomQuotesViewModel())
    }
}
