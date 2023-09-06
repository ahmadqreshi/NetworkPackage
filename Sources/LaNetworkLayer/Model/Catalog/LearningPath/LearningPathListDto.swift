import Foundation

public struct LearningPathListDto: Codable {
    public let items: [LearningPathDto]
    public let offset: String?
}
