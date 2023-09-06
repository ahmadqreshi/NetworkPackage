import Foundation

public struct LessonDto: Hashable, Codable {
    
    public static func == (lhs: LessonDto, rhs: LessonDto) -> Bool {
        return lhs.lessonID == rhs.lessonID
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(lessonID)
    }
    
    public let lessonID: String
    public let title: String
    public let canonicalTitle: String
    public let summary: String?
    public let details: String?
    public let isFree: Bool
    public let isReleased: Bool
    public let releaseDate: String?
    public let createdAt: String?
    public let updatedAt: String?
    public let mentors: [MentorDto]?
    public let topics: [TopicDto]
    
    public enum CodingKeys: String, CodingKey {
        case lessonID = "lessonId"
        case title, canonicalTitle, summary, details, isFree, isReleased
        case releaseDate, createdAt, updatedAt, mentors, topics
    }
}
