import Foundation

public struct CourseProgressListResponseDto: Codable {
    public let progress: [CourseProgressDto]
}

public struct CourseProgressResponseDto: Codable {
    public let courseProgressData: CourseProgressDto?
}

// MARK: - CourseProgressDto
public struct CourseProgressDto: Codable {
    public let courseId: String
    public let lastViewedTopicId: String
    public let lastViewedTopicTitle: String
    public let lastViewedLessonId: String
    public let totalTopics: Int
    public let topicsCompleted: Int
    public let lastViewedAt: String
    public let resumeTime: Double
    public let type: ModelType
    public let percentage: Double
    public let isCompleted: Bool
}

public enum ModelType: String, Codable {
    case course = "course"
    case webinar = "webinar"
    case workshop = "workshop"
    case advanceCourse = "advance-course"
}

// MARK: - CourseProgressDetailedResponseDto

public struct CourseProgressDetailedResponseDto: Codable {
    public let courseDetailData: CourseProgressDetailedDto?
}

public struct CourseProgressDetailedDto: Codable {
    public let courseId: String
    public let lastViewedTopicId: String
    public let lastViewedTopicTitle: String
    public let lastViewedLessonId: String
    public let totalTopics: Int
    public let topicsCompleted: Int
    public let resumeTime: Double
    public let lastViewedAt: String
    public let type: ModelType
    public let percentage: Int
    public let isCompleted: Bool
    public let lessons: [LessonDataDto]
}

// MARK: - LessonDataDto
public struct LessonDataDto: Codable {
    public let lessonId: String
    public let lastViewedAt: String
    public let topics: [TopicDataDto]
}

// MARK: - TopicDataDto
public struct TopicDataDto: Codable {
    public let topicId: String
    public let resumeTime: Double
    public let lastViewedAt: String
    public let isCompleted: Bool
    
    public init(topicId: String, resumeTime: Double, lastViewedAt: String, isCompleted: Bool) {
        self.topicId = topicId
        self.resumeTime = resumeTime
        self.lastViewedAt = lastViewedAt
        self.isCompleted = isCompleted
    }
}


