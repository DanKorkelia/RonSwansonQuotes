//
//  URL+StaticString.swift
//  RonSwansonQuotes
//
//  Created by Dan Korkelia on 30/12/2020.
//  Copyright © 2020 Dan Korkelia. All rights reserved.
//

import Foundation

extension URL {
    /// Use this init for static URL strings to avoid using force unwrap or doing redundant error handling
    /// - Parameter string: static url ie https://www.example.com/privacy/
    init(_ string: StaticString) {
        guard let url = URL(string: "\(string)") else {
            fatalError("URL is illegal: \(string)")
        }
        self = url
    }
}
