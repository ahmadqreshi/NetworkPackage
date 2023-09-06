//
//  Environment.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 19/01/23.
//

import Foundation
public enum PlistKey: String {
    case hydraBaseUrl
    case catalogBaseUrl
    case hydraApiKey
    case catalogApiKey
    case mintBaseUrl
    case mintApiKey
    case recaptchaKey
    case assetUrl
    case googleClientId
    case launchVideoUrl
    case subscribeToLearnAppBannerUrl
    case intercomApiKey
    case intercomAppId
    case moengageAppId
    case uxcamAppKey
    case censusApiKey
    case censusBaseUrl
    case engageApiKey
    case engageBaseUrl
    
    public var keyValue: String {
        return self.rawValue.description
    }
}
public struct Environments {
    public init() {}
    fileprivate var infoDict: [String: Any] {
        if let dict = Bundle.main.infoDictionary {
            return dict
        } else {
            fatalError("Plist file not found")
        }
    }
    
    public func configuration(_ key: PlistKey) -> String {
        return infoDict[key.keyValue] as? String ?? ""
    }
}
