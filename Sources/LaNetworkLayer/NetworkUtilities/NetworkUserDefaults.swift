//
//  File.swift
//  
//
//  Created by Ahmad Qureshi on 28/02/23.
//

import Foundation
class NetworkUserDefaults {
    static let shared = NetworkUserDefaults()
    
    private init() {}
    
    enum Key: String {
        case accessToken
        case refreshToken
        case tokenExpiryDate
        case userProfile
        case isAdvancedCourseSubscribed
        case isBasePlanSubscribed
        case isSingleCourseSubscribed
        case basePlanId
        case subscriptionExpiry
        case utm
    }
}

extension NetworkUserDefaults {
    func value(forKey key: Key) -> Any? {
        guard let value = UserDefaults.standard.object(forKey: key.rawValue) else {
            return nil
        }
        return value
    }
}
