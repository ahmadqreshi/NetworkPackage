import Foundation

public struct AssetsDto: Codable {
    public let trailerVideoId, bcPlaylistId, resourceLink: String?
    public let card50x50j, card50x50w, card85x103j, card85x103w, card238x165j, card238x165w, card238x330j, card238x330w, card256x256j, card256x256w, card270x350j, card270x350w, card290x201j, card290x201w, card334x180j, card334x180w, card650x350j, card650x350w, card1440x545j, card1440x545w, card1536x645j, card1536x645w, card640x645j, card640x645w: Asset?
    
   public enum CodingKeys: String, CodingKey {
        case trailerVideoId = "trailerVideoId"
        case bcPlaylistId = "bcPlaylistId"
        case card50x50j = "card-50x50-jpg"
        case card50x50w = "card-50x50-webp"
        case card85x103j = "card-85x103-jpg"
        case card85x103w = "card-85x103-webp"
        case card238x165j = "card-238x165-jpg"
        case card238x165w = "card-238x165-webp"
        case card238x330j = "card-238x330-jpg"
        case card238x330w = "card-238x330-webp"
        case card256x256j = "card-256x256-jpg"
        case card256x256w = "card-256x256-webp"
        case card270x350j = "card-270x350-jpg"
        case card270x350w = "card-270x350-webp"
        case card290x201j = "card-290x201-jpg"
        case card290x201w = "card-290x201-webp"
        case card334x180j = "card-334x180-jpg"
        case card334x180w = "card-334x180-webp"
        case card650x350j = "card-650x350-jpg"
        case card650x350w = "card-650x350-webp"
        case card1440x545j = "card-1440x545-jpg"
        case card1440x545w = "card-1440x545-webp"
        case card1536x645j = "card-1536x645-jpg"
        case card1536x645w = "card-1536x645-webp"
        case card640x645j = "card-640x645-jpg"
        case card640x645w = "card-640x645-webp"
        case resourceLink
    }
}

public struct Asset: Codable {
    public let alt: String
    public let url: String
}
