//
//  RandomQuotesViewModel.swift
//  RonSwansonQuotes
//
//  Created by Dan Korkelia on 30/12/2020.
//  Copyright © 2020 Dan Korkelia. All rights reserved.
//

import Foundation

final class RandomQuotesViewModel: ObservableObject {
    @Published var quote: String = ""
    
    private var data: QuotesDataProvidable
    private let userDefaults: UserDefaults
    
    init(
        data: QuotesDataProvidable = QuotesDataProvider(),
        userDefaults: UserDefaults = .standard
    ) {
        self.data = data
        self.userDefaults = userDefaults
    }
    
    func getQuote() {
        let fallBackValue = "There was a problem fetching my quotes"
        data.fetchQuotes(count: 20, defaultValue: [fallBackValue]) { [weak self] result in
            self?.quote = result.map { $0 }.first ?? fallBackValue
        }
    }
    
    func getQuotes() async {
        let fallBackValue = "There was a problem fetching my quotes"
        let result = await data.fetchQuotes(count: 20, defaultValue: [fallBackValue])
        DispatchQueue.main.async {
            self.quote = result.map { $0 }.first ?? fallBackValue
        }
    }
    
    func storeCurrentQuoteInFavorites() {
        let existing = userDefaults.object(forKey: "FavoriteQuotes") as? [String] ?? [String]()
        let newArray = [quote]
        let difference = Array(Set(newArray + existing))
        userDefaults.set(difference, forKey: "FavoriteQuotes")
    }
}
