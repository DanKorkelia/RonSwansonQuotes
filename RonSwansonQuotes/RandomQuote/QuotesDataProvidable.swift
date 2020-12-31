//
//  QuotesDataProvidable.swift
//  RonSwansonQuotes
//
//  Created by Dan Korkelia on 30/12/2020.
//

import Foundation

protocol QuotesDataProvidable {
    func fetchQuotes(count: Int, defaultValue: [String], completion: @escaping ([String]) -> Void)
}
