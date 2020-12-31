//
//  SaveQuoteView.swift
//  RonSwansonQuotes
//
//  Created by Dan Korkelia on 30/12/2020.
//

import SwiftUI

struct SaveQuoteView: View {
    var saveQuote: () -> ()?
    
    var body: some View {
        Button {
            saveQuote()
        } label: {
            Image(systemName: "heart")
                .font(.title)
                .padding()
        }.accessibilityHint("A new quote will be shown")
    }
}

struct SaveQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        SaveQuoteView(saveQuote: {})
    }
}
