//
//  EndPoint+Parameters.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 04/11/22.
//

import Foundation
extension Endpoint {
    /// parameters Dictionary for each request
    var parameters: [String: Any] {
        switch self {
        case .login(let email,let password,let captcha):
            return ["email" : email, "password" : password, "captcha" : captcha]
            
        case .signup(let request):
            return request.getRequestJson()
            
        case .loginWithGoogle(let token, let couponCode):
            if let couponCode = couponCode {
                return ["token" : token,"couponCode": couponCode]
            }
            return ["token" : token]
            
            
        case .loginWithApple(let request):
            return request.getRequestJson()
            
        case .updateUserProfile(let request):
            return request.getRequestJson()
            
        case .sendEmail(let email, let captcha):
            return ["email" : email, "captcha" : captcha]
            
        case .resetPassword(let request):
            return request.getRequestJson()
            
        case .fetchAllCoursesUsingSubjectId(let courseType, let subjectId):
            return ["type" : courseType, "subject" : subjectId]
            
        case .refreshToken(let request):
            return request.getRequestJson()
            
        case .postTopicProgressEvent(let courseProgressEventBatchDto):
            return encodeParameters(request: courseProgressEventBatchDto)
            
        case .getCourseProgressDetail(let couseId):
            return ["courseId" : couseId]
            
        case .createComment(let createCommentDto):
            return encodeParameters(request: createCommentDto)
            
        case .updateComment(_, let updateCommentDto): //commentId
            return encodeParameters(request: updateCommentDto)
            
        case .getComments(let courseId, let lessonId, let offset):
            if let tempOffset = offset {
                return ["courseId": courseId, "lessonId": lessonId, "offset": tempOffset]
            } else {
                return ["courseId": courseId, "lessonId": lessonId]
            }
            
        case .changePassword(let request):
            return request.getRequestJson()
            
        case .programme(let canonicalTitle):
            return ["title" : canonicalTitle]
            
        case .getPrime(let id):
            return ["id" : id]
            
        case .verifyPayment( _, let receiptData):
            return ["receiptData" : receiptData]
            
        default:
            return [:]
        }
    }
    
    
    private func encodeParameters<T: Encodable>(request: T) -> [String: Any] {
        let encoder = JSONEncoder()
        let jsonData = try! encoder.encode(request)
        return try! JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] ?? [:]
    }
    
}
