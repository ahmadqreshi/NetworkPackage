//
//  File.swift
//  
//
//  Created by Ahmad Qureshi on 08/06/23.
//

import Foundation

public struct ProgrammeDto: Codable {
    public let title, subjectName, description, structureDescription: String
    public let cohort: Cohort
    public let isActive: Bool
    public let assets: [String: Asset]
    public let testimonials: [Testimonial]
    public let faq: [ProgrammeFAQ]
}


// MARK: - Cohort
public struct Cohort: Codable {
    public let cohortName, startDate: String
    public let ctaLink: String
    public let curriculum: [Curriculum]
}

// MARK: - Curriculum
public struct Curriculum: Codable {
    public let card: CurriculumCard
    public let id: String?
    public let type: CurriculumCardType
    public let liveLink: String?
    public let details: CurriculumDetails?
}

// MARK: - CurriculumCardCard
public struct CurriculumCard: Codable {
    public let sideInfo, sideTitle, sideSubtitle: String?
    public let title: String
    public let pointers: [String]
    public let subtitle, assesmentFormLink: String?
}

// MARK: - Details
public struct CurriculumDetails: Codable {
    public let canonicalTitle: String
    public let assets: AssetsDto?
    public let trailerVideoID, mentorName, mentorTitle, mentorCompany: String?

    public enum CodingKeys: String, CodingKey {
        case canonicalTitle, assets
        case trailerVideoID = "trailerVideoId"
        case mentorName, mentorTitle, mentorCompany
    }
}

public enum CurriculumCardType: String, Codable {
    case assessment = "assessment"
    case course = "course"
    case practice = "practice"
}


// MARK: - ProgrammeFAQ
public struct ProgrammeFAQ: Codable {
    public let faqs: [ProgrammeFaqDto]
}

// MARK: - ProgrammeFaqDto
public struct ProgrammeFaqDto: Codable {
    public let que, ans: String
}

// MARK: - Testimonial
public struct Testimonial: Codable {
    public let name, designation, text, imageURL: String

    public enum CodingKeys: String, CodingKey {
        case name, designation, text
        case imageURL = "imageUrl"
    }
}
