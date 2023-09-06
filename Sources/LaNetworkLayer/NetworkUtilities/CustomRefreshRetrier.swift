//
//  CustomRefreshRetrier.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 04/11/22.
//

import Foundation
import Alamofire
class CustomRequestRetrier: RequestAdapter, RequestRetrier {
    var endpoint: Endpoint
    let retryLimit = 3
    let retryDelay: TimeInterval = 10
    init(endpoint: Endpoint) {
        self.endpoint = endpoint
    }

    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        let modifiedUrlRequest = urlRequest
        _ = urlRequest.value(forHTTPHeaderField: "Authorization")
        completion(.success(modifiedUrlRequest))
    }

    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        print("CustomRequestRetrier should retry request: \(request)")
        let response = request.task?.response as? HTTPURLResponse
        if let statusCode = response?.statusCode,
          (500...599).contains(statusCode),
          request.retryCount < retryLimit {
            completion(.retryWithDelay(retryDelay))
        } else {
          return completion(.doNotRetry)
        }
    }
}

class RefreshingTokenRequestRetrier: RequestAdapter, RequestRetrier {
    var endpoint: Endpoint
    
    init(endpoint: Endpoint) {
        self.endpoint = endpoint
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        let modifiedUrlRequest = urlRequest
//        let currentToken = urlRequest.value(forHTTPHeaderField: "Authorization")
        completion(.success(modifiedUrlRequest))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        print("RefreshingTokenRequestRetrier should retry request: \(request)")
        print("RefreshingTokenRequestRetrier should retry request completion")
        completion(.retryWithDelay(7))
    }
}
