import Foundation

public struct TopicReleaseDateDto: Codable {
    public let topicID: String
    //let isLive: Bool
    public let date: String
    public let duration: Int64?
    
    public enum CodingKeys: String, CodingKey {
        case topicID = "topicId"
        case date, duration
        //case isLive
    }
}
