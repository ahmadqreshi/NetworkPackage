import Foundation

public struct UpdateCommentDto: Codable {
    public let message: String
    public init(message: String) {
        self.message = message
    }
}
