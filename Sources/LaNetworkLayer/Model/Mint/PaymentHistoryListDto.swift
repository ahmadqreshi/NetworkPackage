import Foundation

public struct PaymentHistoryListDto: Codable {
    public let transactions: [PaymentHistoryDto]
    public let userPlans: [AccessPolicy]
}

