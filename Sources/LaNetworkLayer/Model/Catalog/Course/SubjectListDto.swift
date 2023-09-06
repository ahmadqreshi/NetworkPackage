//
//  SubjectListDto.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 20/12/22.
//

import Foundation
public struct SubjectListDto: Codable {
   public let workshops, webinars, courses, advCourses: [SubjectDetail]
}

// MARK: - Subject Detail
public struct SubjectDetail: Codable, Hashable, Identifiable {
    public var id, subject: String
    public var rank: Int
    public enum CodingKeys: String, CodingKey {
        case id = "subjectId"
        case subject, rank
    }
    public static func == (lhs: SubjectDetail, rhs: SubjectDetail) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
