import Foundation

// MARK: - PlanDto
public struct PlanDto: Hashable, Codable {
    
    public static func == (lhs: PlanDto, rhs: PlanDto) -> Bool {
        return lhs.planId == rhs.planId
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(planId)
    }
    
    public let planName: String
    public let baseAmount: Double
    public let validity: Int
    public let paymentTypes: [PaymentType]
    public let currency: String
    public let isBasePlan: Bool
    public let benefit: PlanBenefitDto
    public let maxPossibleDiscounts: [DiscountDto]?
    public let planId: String
    public let amount: Double
}

// MARK: - Payment Type
public enum PaymentType: String, Codable, CaseIterable {
    case subscription = "SUBSCRIPTION"
    case oneTimePayment = "ONETIMEPAYMENT"
    case subscriptionCanceled = "SUBSCRIPTION_CANCELED"
    
    public var label: String {
        switch self {
        case .subscription: return "Subscription"
        case .oneTimePayment: return "One Time Payment"
        case .subscriptionCanceled: return "Subscription Canceled"
        }
    }
}

// MARK: - Discount Type
public enum DiscountType: String, Codable, CaseIterable {
    case validity = "VALIDITY"
    case priceFlat = "PRICE_FLAT"
    case pricePercentage = "PRICE_PERCENTAGE"
    
    public var label: String {
        switch self {
            case .validity: return "Validity"
            case .priceFlat: return "Price flat"
            case .pricePercentage: return "Price percentage"
        }
    }
}

// MARK: - DiscountDto
public struct DiscountDto: Codable {
    public let discountType: DiscountType
    public let discountValue: Int
}

// MARK: - PlanBenefitDto
public struct PlanBenefitDto: Codable {
    public let type: AccessType
    public let ids: [String]
}

// MARK: - Plan Validity Type
public enum ValidityType: String, Codable, CaseIterable {
    case limited = "Limited Access"
    case annual = "Annual Subscription"
    case quarterly = "Quarterly Subscription"
    case active = "Active Subscription"
    
    public var validity: Int {
        switch self {
            case .limited, .active: return 0
            case .annual: return 12
            case .quarterly: return 3
        }
    }
}
