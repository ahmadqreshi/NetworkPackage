import Foundation

// MARK: - TopicDto
public struct TopicDto: Hashable, Codable {
    
    public static func == (lhs: TopicDto, rhs: TopicDto) -> Bool {
        return lhs.topicID == rhs.topicID
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(topicID)
    }
    
    public let topicID: String
    public let title: String
    public let canonicalTitle: String
    public let isFree: Bool
    public let isLive: Bool?
    public let isReleased: Bool
    public let isResourceReleased: Bool?
    public let releaseDate: String?
    public let summary: String?
    public let resource: TopicDtoResource?
    public let createdAt: String?
    public let updatedAt: String?
    public let mentors: [MentorDto]?
    
    public enum CodingKeys: String, CodingKey {
        case topicID = "topicId"
        case title, canonicalTitle, isFree, isLive, isReleased, isResourceReleased
        case releaseDate, summary, resource, createdAt, updatedAt, mentors
    }
}

// MARK: - TopicDtoResource
public struct TopicDtoResource: Codable {
    public let topicVideoIdBc: String?
    public let topicVideoIdYoutube: String?
    public let playbackTime: Int64?
    public let topicVideoIdVimeo: String?
    public let topicVideoZoomLink: String?
}

// MARK: - Extension isTopicAccessible
extension TopicDto {
    public func isTopicAccess(isCourseAccess: Bool) -> Bool {
        return (isCourseAccess || self.isFree) && self.resource?.topicVideoIdBc != nil
    }
}
