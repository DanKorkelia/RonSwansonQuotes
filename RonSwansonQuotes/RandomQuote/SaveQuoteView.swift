//
//  SaveQuoteView.swift
//  RonSwansonQuotes
//
//  Created by Dan Korkelia on 30/12/2020.
//  Copyright © 2020 Dan Korkelia. All rights reserved.
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
        }
        .accessibilityIdentifier("save_quote")
        .accessibilityHint("A new quote will be shown")
        
    }
}

struct SaveQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        SaveQuoteView(saveQuote: {})
    }
}
