//
//  CourseListDto.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 21/12/22.
//

import Foundation
//MARK: - Available courses
public struct ReadCatalogDto: Codable {
    public let courses, webinars, workshops, advCourses: [ReadCourseListDto]?
}

// MARK: - Courses Detalis
public struct ReadCourseListDto: Codable {
    public let subjectID, subject: String
    public let items: [CourseDto]
    public let offset: String?

    public enum CodingKeys: String, CodingKey {
        case subjectID = "subjectId"
        case subject, items, offset
    }
}
