//
//  NetworkClientProtocol.swift
//  RonSwansonQuotes
//
//  Created by Dan Korkelia on 30/12/2020.
//  Copyright © 2020 Dan Korkelia. All rights reserved.
//

import Foundation

public protocol NetworkClientProtocol {
    func request(_ payload: NetworkRequest, completion: @escaping (_ success: Data?, _ failure: NetworkError?) -> Void)
    func requestAsync(_ payload: NetworkRequest) async throws -> Data
}
