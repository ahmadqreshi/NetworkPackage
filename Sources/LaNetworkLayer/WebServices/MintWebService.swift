import Foundation

class MintWebService {
    
    static let shared = MintWebService()
    
    func getPlans(success: @escaping SuccessCompletionBlock<PlanListDto>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(endpoint: .getPlans, successHandler: success, failureHandler: failure)
    }
    
    func getPaymentHistory(success: @escaping SuccessCompletionBlock<PaymentHistoryListDto>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(endpoint: .getTransactionHistory, successHandler: success, failureHandler: failure)
    }
    
    func verifyPayment(transactionId: String, receiptData: String, success: @escaping SuccessCompletionBlock<PaymentHistoryDto>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(endpoint: .verifyPayment(transactionId: transactionId, receiptData: receiptData), successHandler: success, failureHandler: failure)
    }
}
