import Foundation

// MARK: - LearningPathProgress
public struct LearningPathProgressResponseDto: Codable {
    public let pathProgressData: LearningPathProgressDto
}

public struct LearningPathProgressDto: Codable {
    public let pathId: String
    public let percentage: Double
    public let totalModules: Int
    public let modulesCompleted: Int
    public let isCompleted: Bool
}

public struct AllLearningPathProgressResponseDto: Codable {
    public let learningPaths: [LearningPathProgressDto]
}

// MARK: - ModuleProgress
public struct ModuleProgressResponseDto: Codable {
    public let moduleProgressData: ModuleProgressDto
}

public struct ModuleProgressDto: Codable {
    public let moduleId: String
    public let percentage: Double
    public let totalCourses: Int
    public let coursesCompleted: Int
    public let isCompleted: Bool
}

public struct ModuleProgressListDto: Codable {
    public var modules: [ModuleProgressDto]
}
