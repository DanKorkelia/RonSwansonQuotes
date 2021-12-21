//
//  QuotesDataProvidable.swift
//  RonSwansonQuotes
//
//  Created by Dan Korkelia on 30/12/2020.
//  Copyright © 2020 Dan Korkelia. All rights reserved.
//

import Foundation

protocol QuotesDataProvidable {
    func fetchQuotes(count: Int, defaultValue: [String], completion: @escaping ([String]) -> Void)
    func fetchQuotes(count: Int, defaultValue: [String]) async -> [String]
}
