//
//  QuoteView.swift
//  RonSwansonQuotes
//
//  Created by Dan Korkelia on 30/12/2020.
//  Copyright © 2020 Dan Korkelia. All rights reserved.
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
                .minimumScaleFactor(0.01)
                .foregroundColor(Color(.systemBlue))
            
        }
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(quote: "Hello, my name is Ron Swanson.")
    }
}
