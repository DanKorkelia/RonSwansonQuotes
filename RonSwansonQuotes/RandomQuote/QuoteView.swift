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
        .padding()
        
        .frame(maxWidth: 350,
               maxHeight: 350,
               alignment: .topLeading)
        
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(quote: "Hello, my name is Ron Swanson.")
    }
}
