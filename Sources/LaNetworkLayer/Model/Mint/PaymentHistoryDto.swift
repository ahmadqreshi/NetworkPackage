import Foundation

public struct PaymentHistoryDto: Hashable, Codable {
    
    public static func == (lhs: PaymentHistoryDto, rhs: PaymentHistoryDto) -> Bool {
        return lhs.transactionId == rhs.transactionId
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(transactionId)
    }

    public let transactionId: String
    public let planId: String
    public let planName: String
    public let pg: Pg
    public let basePrice: Double
    public let originalPrice: Double
    public let discountedPrice: Double?
    public let currency: Currency
    public let transactionType: TransactionType
    public let transactionStatus: TransactionStatus
    public let orderId: String
    public let paymentId: String?
    public let linkId: String?
    public let startDate: String?
    public let completedAt: String?
    public let expiryDate: String?
    public let renewalDate: String?
    public let cancelledAt: String?
    public let refundedAt: String?
    public let coupon: String?
    public let discountType: DiscountType?
    public let discountValue: Double?
    public let discountAmount: Double?
    public let createdAt: String
    public let updatedAt: String
    public let refundDetail: RefundDetailDto?
    public let subscriptionDetail: SubscriptionDetailDto?
    public let accessType: AccessType

}

// MARK: - Payment Gateway
public enum Pg: String, Codable, CaseIterable {
    case razorpay = "RAZORPAY"
    case learnapp = "LEARNAPP"
    case appleIAP = "APPLE_IAP"
}

// MARK: - Currency
public enum Currency: String, Codable, CaseIterable {
    case inr = "INR"
    case usd = "USD"
    case aed = "AED"
    case gbp = "GBP"
    case sar = "SAR"
    case qar = "QAR"
    case aud = "AUD"
    case eur = "EUR"
}

// MARK: - Transaction Type
public enum TransactionType: String, Codable, CaseIterable {
    case subscription = "SUBSCRIPTION"
    case onetimepayment = "ONETIMEPAYMENT"
    case subscriptionCanceled = "SUBSCRIPTION_CANCELED"
}

// MARK: - TransactionStatus
public enum TransactionStatus: String, Codable, CaseIterable {
    case created = "CREATED"
    case failed = "FAILED"
    case completed = "COMPLETED"
    case authorised = "AUTHORISED"
    case pending = "PENDING"
    case blocked = "BLOCKED"
    case canceled = "CANCELED"
    case refunded = "REFUNDED"
    case subscriptionActive = "SUBSCRIPTION_ACTIVE"
    case subscriptionPaused = "SUBSCRIPTION_PAUSED"
    case subscriptionCanceled = "SUBSCRIPTION_CANCELED"
}

// MARK: - SubscriptionDetailDto
public struct SubscriptionDetailDto: Codable {
    public let paidCount: Int
    public let remainingCount: Int
    public let totalCount: Int
    public let paymentsCaptured: [PaymentCapturedDto]
}

public struct PaymentCapturedDto: Codable {
    public let id: String
    public let date: String
    public let expiryDate: String
    public let createdAt: String
}


// MARK: - RefundDetailDto
public struct RefundDetailDto: Codable {
    public let date: String
    public let amount: Double
    public let desc: String
}
