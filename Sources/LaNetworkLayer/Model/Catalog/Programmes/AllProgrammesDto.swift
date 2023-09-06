//
//  File.swift
//  
//
//  Created by Ahmad Qureshi on 02/06/23.
//

import Foundation
public struct AllProgrammesDto: Codable {
    public let items: [Item]
}

// MARK: - Item
public struct Item: Codable {
    public let subject: Subject
    public let programmes: [Programme]
}

// MARK: - Programme
public struct Programme: Codable {
    public let programmeID, title, canonicalTitle, startDate: String
    public let assets: [String: Asset]
    public let mentors: [MentorDto]

    public enum CodingKeys: String, CodingKey {
        case programmeID = "programmeId"
        case title, canonicalTitle, startDate, assets, mentors
    }
}

// MARK: - Subject
public struct Subject: Codable {
    public let type, description: String
}


