//
//  RandomQuoteView.swift
//  RonSwansonQuotes
//
//  Created by Dan Korkelia on 30/12/2020.
//  Copyright © 2020 Dan Korkelia. All rights reserved.
//

import SwiftUI

struct RandomQuoteView: View {
    static let tag: String? = "Random"
    
    @EnvironmentObject var dataModel: RandomQuotesViewModel
    @State private var showingShareSheet = false
    
    var body: some View {
        NavigationView {
            List {
                VStack {
                    if dataModel.quote.isEmpty {
                        EmptyView()
                    } else {
                        QuoteView(quote: dataModel.quote)
                        SaveQuoteView(saveQuote: dataModel.storeCurrentQuoteInFavorites)
                    }

                }
            }
            .refreshable {
                await dataModel.getQuotes()
            }
            .navigationTitle("Quote")
        }

        .onAppear {
            Task { await dataModel.getQuotes() }
        }

    }
}

struct RandomQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RandomQuoteView()
                .environmentObject(RandomQuotesViewModel(data: QuotesDataProvider(), userDefaults: .standard))
                .preferredColorScheme(.dark)
        }
    }
}
