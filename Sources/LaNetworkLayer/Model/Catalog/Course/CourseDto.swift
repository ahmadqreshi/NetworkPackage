import Foundation

// MARK: - CourseDto
public struct CourseDto: Codable, Identifiable, Hashable {
    public let id: String
    public let type: CourseType
    public let contentType: ContentType
    public let title: String
    public let canonicalTitle: String
    public let summary: String?
    public let difficulty: Difficulty
    public let subject: String
    public let totalPlaybackTime: Int64
    public let lessonCount: Int?
    public let categoryRank: Int?
    public let language: [Language]?
    public let features: [String]?
    public let isFree: Bool
    public let isLive: Bool?
    public let isReleased: Bool
    public let isSecret: Bool?
    public let isTrending: Bool?
    public let isFeatured: Bool?
    public let releaseDate: String?
    public let topicReleaseDates: [TopicReleaseDateDto]?
    public let createdAt: String?
    public let updatedAt: String?
    public let assets: AssetsDto
    public let content: CourseContentDto?
    public let mentors: [MentorDto]
    public let lessons: [LessonDto]?
    
    public static func == (lhs: CourseDto, rhs: CourseDto) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - CourseType
public enum CourseType: String, CaseIterable, Codable {
    case course = "course"
    case webinar = "webinar"
    case workshop = "workshop"
    case advanceCourse = "advance-course"
}

// MARK: - ContentType
public enum ContentType: String, CaseIterable, Codable {
    case courses = "courses"
    case classes = "classes"
    case workshops = "workshops"
    case advancedCourses = "advanced-courses"
}

// MARK: - Difficulty
public enum Difficulty: String, Codable, CaseIterable {
    case basic = "basic"
    case advanced = "advanced"
    
    public var label: String {
        switch self {
        case .basic: return "Basic"
        case .advanced: return "Advanced"
        }
    }
    
    public var image: String {
        switch self {
        case .basic: return "difficultyBasic"
        case .advanced: return "difficultyAdvanced"
        }
    }
}

// MARK: - Language
public enum Language: String, Codable, CaseIterable {
    
    case hiIn = "hi-IN"
    case enUs = "en-US"
    
    public var label: String {
        switch self {
        case .hiIn: return "हिंदी"
        case .enUs: return "English"
        }
    }
}


