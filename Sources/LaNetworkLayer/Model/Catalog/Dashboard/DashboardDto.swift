//
//  File.swift
//  
//
//  Created by Ahmad Qureshi on 04/04/23.
//

import Foundation

public struct DashboardDto: Codable {
    public let page: String
    public let data: [DashboardListDto]
}

public struct DashboardListDto: Codable, Identifiable {
    public let type: CellType
    public let id, title: String
    public let cards: [Card]?
    public let identifier: String?
    public let isTitleHidden: Bool?
    public let canonicalTitle: String?
    public let difficulty: Difficulty?
    public let courses: [CourseDto]?
    public let viewType: String?
    public let viewAllLink: String?
}

// MARK: - Card
public struct Card: Codable, Identifiable {
    public let id, cardName: String
    public let redirectURL: String
    public let expiresAt, cardType: String
    public let isActive: Bool
    public let resource: CardResource

    enum CodingKeys: String, CodingKey {
        case id = "cardId"
        case cardName
        case redirectURL = "redirectUrl"
        case expiresAt, cardType, isActive, resource
    }
}

// MARK: - CardResource
public struct CardResource: Codable {
    public let mobileWebp: String
    public let mobileJpg: String
    public let desktopJpg: String?
    public let desktopWebp: String?
}

public enum CellType: String, Codable {
    case banner = "BANNER"
    case playlist = "PLAYLIST"
}

