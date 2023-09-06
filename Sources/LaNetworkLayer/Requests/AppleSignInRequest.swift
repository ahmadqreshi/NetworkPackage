//
//  File.swift
//  
//
//  Created by Ahmad Qureshi on 06/03/23.
//

import Foundation
public struct AppleSignInRequest {
    
    let token, appleUserId: String
    let firstName, lastName: String?
    
    public init(token: String, appleUserId: String, firstName: String?, lastName: String?) {
        self.token = token
        self.appleUserId = appleUserId
        self.firstName = firstName
        self.lastName = lastName
    }
    
    public func getRequestJson() -> [String: Any] {
        var json: [String: Any] = ["token" : token, "appleUserId" : appleUserId]
        if let firstName = firstName, !firstName.isEmpty {
            json["firstName"] = firstName
        }
        if let lastName = lastName, !lastName.isEmpty {
            json["lastName"] = lastName
        }
        return json
    }
}
