//
//  EndPoint.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 04/11/22.
//

import Foundation

enum Endpoint {
    case login(email: String, password: String, captcha: String)
    case signup(request: SignUpRequest)
    case loginWithGoogle(token: String, couponCode: String?)
    case loginWithApple(request: AppleSignInRequest)
    case uploadUserProfile
    case updateUserProfile(request: UpdateProfileRequest)
    case changePassword(request: ChangePasswordRequest)
    case getProfile
    case deleteAccount
    case sendEmail(email: String, captcha: String)
    case resetPassword(request: ResetPasswordRequest)
    case fetchSubjectList
    case getAllCourses
    case fetchAllCoursesUsingSubjectId(courseType: String, subjectId: String)
    case fetchCourseByTitle(courseType: String, courseTitle: String)
    case fetchCourseById(courseType: String, courseId: String)
    case refreshToken(request: RefreshTokenRequest)
    case logout
    case getLearningPath(pathId: String)
    case getLearningPathList
    case getLearningPathModuleList(pathId: String)
    case getLearningPathModuleListWithCourse(pathId: String, moduleId: String)
    case getPlans
    case getTransactionHistory
    case postTopicProgressEvent(courseProgressEventBatchDto: CourseProgressEventBatchDto)
    case getCourseProgress(courseId: String)
    case getAllCourseProgress
    case getCourseProgressDetail(courseId: String)
    case getLearningPathProgress(learningPathId: String)
    case getAllLearningPathProgress
    case getModuleProgress(learningPathId: String, moduleId: String)
    case getAllModuleProgress(learningPathId: String)
    case getDashboardData(dashboardRequest: DashboardRequest)
    case createComment(createCommentDto: CreateCommentDto)
    case getComments(courseId: String, lessonId: String, offset: String?)
    case updateComment(commentId: String, updateCommentDto: UpdateCommentDto)
    case deleteComment(commentId: String)
    case likeComment(commentId: String)
    case unLikeComment(commentId: String)
    case search(query: String)
    case allProgrammes
    case programme(canonicalTitle: String)
    case getPrimeList
    case getPrime(id: String)
    case verifyPayment(transactionId: String, receiptData: String)
}
