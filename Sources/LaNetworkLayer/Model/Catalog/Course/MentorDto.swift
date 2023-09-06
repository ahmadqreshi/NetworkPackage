import Foundation

public struct MentorDto: Codable {
    public let mentorID: String
    public let name: String
    public let title: String?
    public let about: String?
    public let avatar: String?
    public let quote: String?
    public let company: String?
    public init(mentorID: String, name: String, title: String?, about: String?, avatar: String?, quote: String?, company: String?) {
        self.mentorID = mentorID
        self.name = name
        self.title = title
        self.about = about
        self.avatar = avatar
        self.quote = quote
        self.company = company
    }
    public enum CodingKeys: String, CodingKey {
        case mentorID = "mentorId"
        case name, title, about, avatar, quote, company
    }
}

extension MentorDto {
    public func getMentorTitle() -> String {
        var mentor = self.name
        if self.title.isNotNil && !self.title!.isEmpty {
            mentor = mentor + ", " + self.title!
        }
        
        if self.company.isNotNil && !self.company!.isEmpty {
            mentor = mentor + ", " + self.company!
        }
        return mentor
    }
}
