//
//  File.swift
//  
//
//  Created by Ahmad Qureshi on 28/02/23.
//

import Foundation
public struct ResetPasswordRequest: Codable {
    let token, password, captcha, userId: String
    let couponCode: String?
    public init(token: String, password: String, captcha: String, userId: String, couponCode: String?) {
        self.token = token
        self.password = password
        self.captcha = captcha
        self.userId = userId
        self.couponCode = couponCode
    }
    
    public func getRequestJson() -> [String: Any] {
        var json: [String: Any] = ["token" : token, "password" : password, "captcha" : captcha, "userId" : userId]
        if let couponCode = couponCode, !couponCode.isEmpty {
            json["couponCode"] = couponCode
        }
        return json
    }
}
