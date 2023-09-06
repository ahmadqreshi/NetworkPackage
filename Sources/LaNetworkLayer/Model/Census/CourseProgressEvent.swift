import Foundation

public struct CourseProgressEventDto: Codable {
    public let eventName: EventName
    public let courseId: String
    public let lessonId: String
    public let topicId: String
    public let resumeTime: Double
    
    public init(eventName: EventName, courseId: String, lessonId: String, topicId: String, resumeTime: Double) {
        self.eventName = eventName
        self.courseId = courseId
        self.lessonId = lessonId
        self.topicId = topicId
        self.resumeTime = resumeTime
    }
}

public enum EventName: String, Codable {
    case topicstarted = "topicStarted"
    case topicprogressed = "topicProgressed"
    case topiccompleted = "topicCompleted"
}

public struct CourseProgressEventBatchDto: Codable {
    public let events: [CourseProgressEventDto]
    
    public init(events: [CourseProgressEventDto]) {
        self.events = events
    }
}

