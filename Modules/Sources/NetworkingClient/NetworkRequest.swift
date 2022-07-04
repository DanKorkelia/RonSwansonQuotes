//
//  NetworkRequest.swift
//  RonSwansonQuotes
//
//  Created by Dan Korkelia on 30/12/2020.
//  Copyright © 2020 Dan Korkelia. All rights reserved.
//

import Foundation

public struct NetworkRequest {
    let url: URL
    let httpMethod: HttpMethod = .GET
    
    public enum HttpMethod: String, CustomStringConvertible {
        case GET
        case POST
        
        public var description: String {
            self.rawValue
        }
    }
}
