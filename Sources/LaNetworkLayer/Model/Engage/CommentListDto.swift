import Foundation

public struct CommentListDto: Codable {
    public let courseId: String
    public let lessonId: String
    public let offset: String?
    public let comments: [CommentDto]
}
