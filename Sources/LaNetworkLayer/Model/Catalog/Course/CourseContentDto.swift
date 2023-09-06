import Foundation

public struct CourseContentDto: Codable {
    public let about: CourseAbout?
    public let eligibility: CourseEligibility?
    public let feature: CourseFeature?
    public let description: String?
    public let learningItems: [LearningItems]?
    public let mentorCredentials: [LearningItems]?
    public let subTitle: String?
    public let tags: [String]?
    public let faq: [FaqCategoryDto]?
    public let watchedUser: String?
}

// MARK: - CourseAbout
public struct CourseAbout: Codable {
    public let description, title: String
}

// MARK: - CourseEligibility
public struct CourseEligibility: Codable {
    public let eligibilityItems: [CourseAbout]
    public let title: String
}

// MARK: - CourseFeature
public struct CourseFeature: Codable {
    public let featureItems: [CourseAbout]
    public let title: String
}

// MARK: - LearningItems
public struct LearningItems: Codable, Hashable {
    
    public static func == (lhs: LearningItems, rhs: LearningItems) -> Bool {
        return lhs.title == rhs.title
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    public let title: String
}

// MARK: - FaqCategoryDto
public struct FaqCategoryDto: Codable, Hashable {
    
    public static func == (lhs: FaqCategoryDto, rhs: FaqCategoryDto) -> Bool {
        return lhs.title == rhs.title
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    public let title: String?
    public let faqs: [FaqDto]
}

// MARK: - FaqDto
public struct FaqDto: Codable, Hashable {
    
    public static func == (lhs: FaqDto, rhs: FaqDto) -> Bool {
        return lhs.que == rhs.que
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(que)
    }
    
    public let que: String
    public let ans: String
    public var isOpen: Bool = false
}
