//
//  WebService.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 04/11/22.
//

import SwiftUI
class HydraWebService {
    
    static let shared = HydraWebService()
    private init() {}
    
    func login(email: String, password: String, captcha: String, success: @escaping SuccessCompletionBlock<LoginResponseModel>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(endpoint: .login(email: email, password: password, captcha: captcha), successHandler: success, failureHandler: failure)
    }
    
    func signUp(request: SignUpRequest, success: @escaping SuccessCompletionBlock<SignUpResponseModel>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(endpoint: .signup(request: request), successHandler: success, failureHandler: failure)
    }
    
    func loginWithGoogle(token: String, couponCode: String?, success: @escaping SuccessCompletionBlock<LoginResponseModel>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(endpoint: .loginWithGoogle(token: token, couponCode: couponCode), successHandler: success, failureHandler: failure)
    }
    
    func loginWithApple(request: AppleSignInRequest, success: @escaping SuccessCompletionBlock<LoginResponseModel>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(endpoint: .loginWithApple(request: request), successHandler: success, failureHandler: failure)
    }
    
    func uploadUserProfile(profileImage: UIImage, success: @escaping SuccessCompletionBlock<UploadProfileImageResponse>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.uploadFile(image: profileImage, endpoint: .uploadUserProfile, successHandler: success, failureHandler: failure)
    }
    
    func updateUserProfile(request: UpdateProfileRequest, success: @escaping SuccessCompletionBlock<ProfileModel>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(endpoint: .updateUserProfile(request: request), successHandler: success, failureHandler: failure)
    }
    
    func getUserProfile(success: @escaping SuccessCompletionBlock<ProfileModel>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(endpoint: .getProfile, successHandler: success, failureHandler: failure)
    }
    
    func sendEmail(email: String, captcha: String, success: @escaping SuccessCompletionBlock<EmptyDataResponse>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(endpoint: .sendEmail(email: email, captcha: captcha), successHandler: success, failureHandler: failure)
    }
    
    func resetPassword(request: ResetPasswordRequest, success: @escaping SuccessCompletionBlock<EmptyDataResponse>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(endpoint: .resetPassword(request: request), successHandler: success, failureHandler: failure)
    }
    
    func refreshToken(request: RefreshTokenRequest, success: @escaping SuccessCompletionBlock<RefreshTokenResponse>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(endpoint: .refreshToken(request: request), successHandler: success, failureHandler: failure)
    }
    
    func deleteAccount(success: @escaping SuccessCompletionBlock<EmptyDataResponse>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(endpoint: .deleteAccount, successHandler: success, failureHandler: failure)
    }
    
    func userLogout(success: @escaping SuccessCompletionBlock<EmptyDataResponse>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(endpoint: .logout, successHandler: success, failureHandler: failure)
    }
    
    func changePassword(request: ChangePasswordRequest, success: @escaping SuccessCompletionBlock<EmptyDataResponse>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(endpoint: .changePassword(request: request), successHandler: success, failureHandler: failure)
    }
}
