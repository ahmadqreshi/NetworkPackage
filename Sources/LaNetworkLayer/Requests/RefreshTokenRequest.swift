//
//  File.swift
//  
//
//  Created by Ahmad Qureshi on 09/05/23.
//

import Foundation
public struct RefreshTokenRequest {
    let grantType: String = "refresh_token"
    let refreshToken: String?
    let clientId: String?
    let clientSecret: String?
    
    public init(refreshToken: String?, clientId: String?, clientSecret: String?) {
        self.refreshToken = refreshToken
        self.clientId = clientId
        self.clientSecret = clientSecret
    }
    
    public func getRequestJson() -> [String: Any] {
        var json: [String: Any] = ["grantType": "refresh_token"]
        
        if let refreshToken = refreshToken {
            json["refreshToken"] = refreshToken
        }
        
        if let clientId = clientId {
            json["clientId"] = clientId
        }
        
        if let clientSecret = clientSecret {
            json["clientSecret"] = clientSecret
        }
        return json
    }
}
