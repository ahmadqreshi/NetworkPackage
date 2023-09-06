import Foundation

public struct CommentDto: Codable, Hashable {
    
    public static func == (lhs: CommentDto, rhs: CommentDto) -> Bool {
        return lhs.commentId == rhs.commentId
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(commentId)
    }

    public let commentId: String
    public let userId: String
    public let message: String
    public let likeCount: Int
    public let isCommentEdited: Bool
    public let hasUserLikedComment: Bool
    public let user: UserCommentDto?
    public let createdAt: String
    public let updatedAt: String
    public let replyCount: Int
    public let replies: [ChildCommentDto]?
}

public struct ChildCommentDto: Codable, Hashable {
    
    public static func == (lhs: ChildCommentDto, rhs: ChildCommentDto) -> Bool {
        return lhs.commentId == rhs.commentId
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(commentId)
    }
    
    public let commentId: String
    public let userId: String
    public let message: String
    public let likeCount: Int
    public let isCommentEdited: Bool
    public let hasUserLikedComment: Bool
    public let user: UserCommentDto?
    public let createdAt: String
    public let updatedAt: String
}

public struct UserCommentDto: Codable {
    public let name: String?
    public let avatarUrl: String?
}
