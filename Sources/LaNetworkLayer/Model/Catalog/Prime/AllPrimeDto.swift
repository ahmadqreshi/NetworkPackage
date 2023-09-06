//
//  File.swift
//  
//
//  Created by Ahmad Qureshi on 25/07/23.
//

import Foundation

// MARK: - Welcome
public struct AllPrimeDto: Codable {
    public let items: [PrimeDto]
}

// MARK: - Item
public struct PrimeDto: Codable {
    public let id, title, canonicalTitle, subtitle: String
    public let subject, startDate, videoID, formID: String
    public let isEnabledForPaid: Bool
    public let sessions: [PrimeSession]
    public let testimonials: [PrimeTestimonial]
    
    public enum CodingKeys: String, CodingKey {
        case id, title, canonicalTitle, subtitle, subject, startDate
        case videoID = "videoId"
        case formID = "formId"
        case isEnabledForPaid, sessions, testimonials
    }
}

// MARK: - Session
public struct PrimeSession: Codable {
    public let topics: [String]
}

// MARK: - Testimonial
public struct PrimeTestimonial: Codable {
    public let text, username, usertype, avatarURL: String
    public let rating: Float
    
    public enum CodingKeys: String, CodingKey {
        case text, username, usertype
        case avatarURL = "avatarUrl"
        case rating
    }
}
