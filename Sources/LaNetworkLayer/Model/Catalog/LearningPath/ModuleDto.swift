import Foundation

public struct ModuleDto: Hashable, Codable {
    
    public static func == (lhs: ModuleDto, rhs: ModuleDto) -> Bool {
        return lhs.moduleID == rhs.moduleID
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(moduleID)
    }
    
    public let moduleID: String
    public let title: String
    public let canonicalTitle: String
    public let description: String?
    public let isReleased: Bool
    public let createdAt: String
    public let updatedAt: String
    public let difficulty: ModuleDifficulty
    public let iconUrl: String?
    public let moduleRank: Int
    public let courses: [CourseDto]?

    public enum CodingKeys: String, CodingKey {
        case moduleID = "moduleId"
        case title
        case canonicalTitle
        case description
        case isReleased
        case createdAt
        case updatedAt
        case difficulty
        case iconUrl
        case moduleRank
        case courses
    }
}

// MARK: - Module Difficulty
public enum ModuleDifficulty: String, Codable, CaseIterable {
    case beginner = "beginner"
    case intermediate = "intermediate"
    
    public var label: String {
        switch self {
        case .beginner: return "Beginner"
        case .intermediate: return "Intermediate"
        }
    }
    
    public var image: String {
        switch self {
        case .beginner: return "difficultyBasic"
        case .intermediate: return "difficultyAdvanced"
        }
    }
}

