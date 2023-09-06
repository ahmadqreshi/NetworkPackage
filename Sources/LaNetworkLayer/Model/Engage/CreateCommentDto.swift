import Foundation

public struct CreateCommentDto: Codable {
    public let message: String
    public let courseId: String
    public let lessonId: String
    public let replyTo: String

    public init(message: String, courseId: String, lessonId: String, replyTo: String) {
        self.message = message
        self.courseId = courseId
        self.lessonId = lessonId
        self.replyTo = replyTo
    }
}
