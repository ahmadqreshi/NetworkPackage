//
//  File.swift
//  
//
//  Created by Ahmad Qureshi on 21/04/23.
//

import Foundation
public struct ChangePasswordRequest: Codable {
    let oldPassword, password: String
    public init(oldPassword: String, password: String) {
        self.oldPassword = oldPassword
        self.password = password
    }
    
    public func getRequestJson() -> [String: Any] {
        return ["oldPassword" : oldPassword, "password" : password]
    }
}
