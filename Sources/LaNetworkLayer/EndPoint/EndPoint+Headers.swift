//
//  EndPoint+Headers.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 04/11/22.
//

import Foundation
import Alamofire

extension Endpoint {
    
    ///API key for different environments and microservices
    var apiKey: String {
        switch microservice {
        case .hydra:
            return Environments().configuration(.hydraApiKey)
        case .catalog:
            return Environments().configuration(.catalogApiKey)
        case .mint:
            return Environments().configuration(.mintApiKey)
        case .census:
            return Environments().configuration(.censusApiKey)
        case .engage:
            return Environments().configuration(.engageApiKey)
        default:
            return ""
        }
    }
    /// http header for each request (if needed)
    var header: HTTPHeaders? {
        var headers: [String : String] = [:]
        headers["x-user-device"] = "IOS"
        headers["x-api-key"] = apiKey
        if let bearerToken = NetworkUserDefaults.shared.value(forKey: .accessToken) {
            headers["Authorization"] = "Bearer \(bearerToken)"
        }
        return HTTPHeaders(headers)
    }
}
