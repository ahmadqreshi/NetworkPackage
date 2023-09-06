//
//  LoginResponseModel.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 22/11/22.
//

import Foundation
public struct LoginResponseModel: Codable {
    public let accessToken, refreshToken: String
    public let expiresIn: Int
    public let profile: ProfileModel
}

// MARK: - Profile
public struct ProfileModel: Codable {
    public let userID,email: String
    public let firstName, lastName, phone, avatarURL: String?
    public let isVerified: Bool
    public let isSuspended: Bool?
    public let roles: [String]
    public var preferences: Preferences?
    public let orgID: String
    public let notificationSettings: NotificationSettings
    public let city, country: String?
    public let accessPolicy: [AccessPolicy]
    public let linkedAccounts: [LinkedAccount]?
    public let createdAt, updatedAt: String
    
    public enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case firstName, lastName, phone, email
        case avatarURL = "avatarUrl"
        case isVerified, isSuspended, roles, preferences, city, country
        case orgID = "orgId"
        case notificationSettings, accessPolicy, linkedAccounts, createdAt, updatedAt
    }
}

// MARK: - AccessPolicy
public struct AccessPolicy: Codable {
    public let type: AccessType
    public let access: [Access]
}

public enum AccessType: String, CaseIterable, Codable {
    case course = "COURSE"
    case webinar = "WEBINAR"
    case playlist = "PLAYLIST"
    case learningMap = "LEARNING_MAP"
    case advanceCourse = "ADVANCE_COURSE"
    case workshop = "WORKSHOP"
    case basePlan = "BASE_PLAN"
    
    
    public var label: String {
        switch self {
        case .course: return "Single Course"
        case .webinar: return "Webinar"
        case .playlist: return "Playlist"
        case .learningMap: return "Learning Map"
        case .advanceCourse: return "Advanced Course"
        case .workshop: return "Workshop"
        case .basePlan: return "Subscription"
        }
    }
    
    
}

// MARK: - Access
public struct Access: Codable {
    public let ids: [String]
    public let expiry, planID, paymentType: String
    public let planName: String?
    
    public enum CodingKeys: String, CodingKey {
        case ids, expiry
        case planID = "planId"
        case planName, paymentType
    }
}

// MARK: - LinkedAccount
public struct LinkedAccount: Codable {
    public let id, name: String
}

// MARK: - preferences
public struct Preferences: Codable {
    public let web: [String: Any]?
    public let android: AndroidUserPreferences?
    public var ios: iOSUserPreferences?
    public var stats: [String: Any]?
    public let freeCourse: FreeCourse?
    public let onBoarding: OnBoarding?
    
    enum CodingKeys: String, CodingKey {
        case web, android, ios, stats, freeCourse, onBoarding
    }
    
    public init(web: [String: Any]?, android: AndroidUserPreferences?, ios: iOSUserPreferences? = nil, stats: [String: Any]? = nil, freeCourse: FreeCourse?, onBoarding: OnBoarding?) {
        self.web = web
        self.android = android
        self.ios = ios
        self.stats = stats
        self.freeCourse = freeCourse
        self.onBoarding = onBoarding
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        web = try? container.decodeIfPresent([String: Any].self, forKey: .web)
        android = try? container.decodeIfPresent(AndroidUserPreferences.self, forKey: .android)
        ios = try? container.decodeIfPresent(iOSUserPreferences.self, forKey: .ios)
        stats = try? container.decodeIfPresent([String: Any].self, forKey: .stats)
        freeCourse = try? container.decodeIfPresent(FreeCourse.self, forKey: .freeCourse)
        onBoarding = try? container.decodeIfPresent(OnBoarding.self, forKey: .onBoarding)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encodeIfPresent(web, forKey: .web)
        try? container.encodeIfPresent(android, forKey: .android)
        try? container.encodeIfPresent(ios, forKey: .ios)
        try? container.encodeIfPresent(stats, forKey: .stats)
        try? container.encodeIfPresent(freeCourse, forKey: .freeCourse)
        try? container.encodeIfPresent(onBoarding, forKey: .onBoarding)
    }
}

public struct OnBoarding: Codable {
    public let type: String
    public let experience: String?
    
    public init(type: String, experience: String?) {
        self.type = type
        self.experience = experience
    }
}

public struct FreeCourse: Codable {
    public let id: String
    
    public init(id: String) {
        self.id = id
    }
}

public struct AndroidUserPreferences: Codable {
    public let utm: UtmParam?
    public let fcmToken: String?
    public let videoSettingsDto: VideoSettingsDto?
}

public struct iOSUserPreferences: Codable {
    public let utm: UtmParam?
    public var playerSettingDto: PlayerSettingsDto?
    
    public init(utm: UtmParam?, playerSettingDto: PlayerSettingsDto?) {
        self.utm = utm
        self.playerSettingDto = playerSettingDto
    }
}

public struct UtmParam: Codable {
    public let utmSource: String?
    public let utmMedium: String?
    public let utmCampaign: String?
    public let utmContent: String?
    public let utmTerm: String?
}
public struct VideoSettingsDto: Codable {
    public let speed: String
    public let quality: String?
    public let downloadQuality: String?
}
public struct PlayerSettingsDto: Codable {
    public let speed: Float
    public let videoQuality: Int
    public let downloadQuality: Int
    
    public init(speed: Float, videoQuality: Int, downloadQuality: Int) {
        self.speed = speed
        self.videoQuality = videoQuality
        self.downloadQuality = downloadQuality
    }
}
public struct NotificationSettings: Codable {
    public var emailSetting: EmailSetting
    public var pushSetting: PushSetting
}

// MARK: - EmailSetting
public  struct EmailSetting: Codable {
    public var offers, newsLetters: Bool
}

// MARK: - PushSetting
public struct PushSetting: Codable {
    public var offers: Bool
}
