//
//  NetworkClientProtocol.swift
//  RonSwansonQuotes
//
//  Created by Dan Korkelia on 30/12/2020.
//

import Foundation

protocol NetworkClientProtocol {
    func request(_ payload: NetworkRequest, completion: @escaping (_ success: Data?, _ failure: NetworkError?) -> Void)
}
