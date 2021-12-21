//
//  FavouriteQuoteView.swift
//  RonSwansonQuotes
//
//  Created by Dan Korkelia on 30/12/2020.
//  Copyright © 2020 Dan Korkelia. All rights reserved.
//

import SwiftUI

/// This is a basic outline to test how quotes can be showed from local (CoreData) or remote storage (iCloud). Currently using user defaults to show basic feature in action
struct FavouriteQuoteView: View {

    static let tag: String? = "Favourites"
    var existing = UserDefaults.standard.object(forKey: "FavoriteQuotes") as? [String] ?? ["You don't have any favourite quotes yet. Add some!"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(existing, id: \.self) { item in
                    Text("\(item)").padding()
                }
            }
            .navigationTitle("Favourites")
        }
    }
}

struct FavouriteQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteQuoteView()
    }
}
