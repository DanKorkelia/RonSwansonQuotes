//
//  NetworkRequest.swift
//  RonSwansonQuotes
//
//  Created by Dan Korkelia on 30/12/2020.
//

import Foundation

struct NetworkRequest {
    let url: URL
    let httpMethod: HttpMethod = .GET
    
    enum HttpMethod: String, CustomStringConvertible {
        case GET
        case POST
        
        var description: String {
            self.rawValue
        }
    }
}
