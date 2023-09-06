import Foundation

public struct LearningPathDto: Hashable, Codable {
    
    public static func == (lhs: LearningPathDto, rhs: LearningPathDto) -> Bool {
        return lhs.ID == rhs.ID
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ID)
    }

    public let ID: String
    public let title: String
    public let canonicalTitle: String
    public let description: String
    public let rank: Int
    public let isReleased: Bool
    public let createdAt: String
    public let updatedAt: String
    public let modules: [ModuleDto]?
    public let items: [ModuleDto]?

    public enum CodingKeys: String, CodingKey {
        case ID = "id"
        case title
        case canonicalTitle
        case description
        case rank
        case isReleased
        case createdAt
        case updatedAt
        case modules
        case items
    }

}
