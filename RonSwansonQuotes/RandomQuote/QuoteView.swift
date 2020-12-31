//
//  QuoteView.swift
//  RonSwansonQuotes
//
//  Created by Dan Korkelia on 30/12/2020.
//

import SwiftUI

struct QuoteView: View {
    let quote: String
    var body: some View {
        VStack(alignment: .leading) {
            Text("Ron Swanson says")
                .foregroundColor(Color(.secondaryLabel))
                .padding(.bottom, 4)
            Text(quote)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color(.systemBlue))
        }
        .padding()
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity,
               alignment: .topLeading)
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(quote: "Hello, my name is Ron Swanson.")
    }
}
