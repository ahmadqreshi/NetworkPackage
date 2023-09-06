//
//  File.swift
//  
//
//  Created by Ahmad Qureshi on 09/05/23.
//

import Foundation

public struct SignUpRequest {

    let email: String
    let password: String
    let captcha: String
    let referrer: String?
    let couponCode: String?
    
    public init(email: String, password: String, captcha: String, referrer: String?, couponCode: String?) {
        self.email = email
        self.password = password
        self.captcha = captcha
        self.referrer = referrer
        self.couponCode = couponCode
    }
    
    public func getRequestJson() -> [String: Any] {
        var json: [String: Any] = ["email" : email, "password" : password, "captcha" : captcha]
        if let referrer = referrer, !referrer.isEmpty {
            json["referrer"] = referrer
        }
        if let couponCode = couponCode, !couponCode.isEmpty {
            json["couponCode"] = couponCode
        }
        return json
    }
}
