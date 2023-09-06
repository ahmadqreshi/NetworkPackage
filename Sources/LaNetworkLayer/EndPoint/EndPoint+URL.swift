//
//  EndPoint+URL.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 04/11/22.
//

import Foundation
import Alamofire

enum MicroServices: String {
    case hydra
    case catalog
    case mint
    case census
    case dashboard
    case engage
}

extension Endpoint {
    /// GET, POST or PUT method for each request
    var method: Alamofire.HTTPMethod {
        switch self {
        case .deleteAccount, .deleteComment, .unLikeComment:
            return .delete
        case .login, .signup, .loginWithGoogle, .loginWithApple, .sendEmail, .resetPassword, .refreshToken, .postTopicProgressEvent, .createComment, .verifyPayment:
            return .post
        case .uploadUserProfile, .updateUserProfile, .updateComment, .changePassword:
            return .put
        default:
            return .get
        }
    }
    
    /// URLEncoding used for GET requests and JSONEncoding for POST and PUT requests
    var encoding: Alamofire.ParameterEncoding {
        if self.method == .get {
            return URLEncoding.default
        } else {
            return JSONEncoding.default
        }
    }
    
    /// URL string for each request
    var path: String {
        let interMediate = "/\(intermediatePath)/"
        switch self {
        case .getTransactionHistory, .createComment, .getComments:
            return baseUrl + "/\(intermediatePath)"
        case .getDashboardData:
            return "\(baseUrl)\(intermediatePath)/" + apiPath
        default:
            return baseUrl + interMediate + apiPath
        }
    }
    
    ///Microservices for different modules
    var microservice: MicroServices {
        switch self {
        case .login, .signup, .loginWithGoogle, .loginWithApple, .sendEmail, .resetPassword, .updateUserProfile, .uploadUserProfile, .refreshToken, .logout, .getProfile, .deleteAccount, .changePassword:
            return .hydra
        case .fetchSubjectList, .getAllCourses, .fetchAllCoursesUsingSubjectId, .fetchCourseByTitle, .fetchCourseById, .getLearningPath, .getLearningPathList, .getLearningPathModuleList, .getLearningPathModuleListWithCourse, .search, .allProgrammes, .programme, .getPrimeList, .getPrime:
            return .catalog
        case .getPlans, .getTransactionHistory, .verifyPayment:
            return .mint
        case .getCourseProgress, .getAllCourseProgress, .getCourseProgressDetail, .getLearningPathProgress, .getAllLearningPathProgress, .getModuleProgress, .getAllModuleProgress, .postTopicProgressEvent:
            return .census
        case .getDashboardData:
            return .dashboard
        case .createComment, .getComments, .updateComment, .deleteComment, .likeComment, .unLikeComment:
            return .engage
        }
    }
    
    var baseUrl: String {
        switch microservice {
        case .hydra:
            return Environments().configuration(.hydraBaseUrl)
        case .catalog:
            return Environments().configuration(.catalogBaseUrl)
        case .mint:
            return Environments().configuration(.mintBaseUrl)
        case .census:
            return Environments().configuration(.censusBaseUrl)
        case .dashboard:
            return Environments().configuration(.assetUrl)
        case .engage:
            return Environments().configuration(.engageBaseUrl)
        }
    }
    
    var intermediatePath: String {
        switch self {
        case .login, .signup, .loginWithGoogle, .loginWithApple, .sendEmail, .resetPassword, .refreshToken, .logout:
            return "auth"
        case .updateUserProfile, .uploadUserProfile, .getProfile, .deleteAccount, .changePassword:
            return "users"
        case .fetchSubjectList, .getAllCourses, .fetchAllCoursesUsingSubjectId, .fetchCourseByTitle, .fetchCourseById, .getLearningPath, .getLearningPathList, .getLearningPathModuleList, .getLearningPathModuleListWithCourse, .getDashboardData, .search, .allProgrammes, .programme, .getPrimeList, .getPrime:
            return "catalog"
        case .getPlans, .getTransactionHistory, .verifyPayment:
            return "transactions"
        case .getCourseProgress, .getAllCourseProgress, .getCourseProgressDetail, .getLearningPathProgress, .getAllLearningPathProgress, .getModuleProgress, .getAllModuleProgress:
            return "progress"
        case .postTopicProgressEvent:
            return "stats"
        case .createComment, .getComments, .updateComment, .deleteComment, .likeComment, .unLikeComment:
            return "comments"
        }
    }
    
    var apiPath: String {
        switch self {
            
        case .login:
            return "login"
            
        case .signup:
            return "signup"
            
        case .loginWithGoogle:
            return "google"
            
        case .loginWithApple:
            return "apple"
            
        case .uploadUserProfile:
            return "profile/upload"
            
        case .updateUserProfile, .getProfile, .deleteAccount:
            return "profile"
            
            
        case .sendEmail:
            return "password-reset"
            
        case .resetPassword:
            return "password-reset/verify"
            
        case .fetchSubjectList:
            return "subjects"
            
        case .fetchAllCoursesUsingSubjectId, .getAllCourses:
            return "discover"
            
        case .fetchCourseByTitle(let courseType, let courseTitle):
            return "\(courseType)/titles/\(courseTitle)"
            
        case .fetchCourseById(let courseType, let courseId):
            return "\(courseType)/\(courseId)"
            
        case .refreshToken:
            return "refresh"
            
        case .logout:
            return "logout"
            
        case .getLearningPath(let pathId):
            return "paths/\(pathId)"
            
        case .getLearningPathList:
            return "paths"
            
        case .getLearningPathModuleList(let pathId):
            return "paths/\(pathId)/modules"
            
        case .getLearningPathModuleListWithCourse(let pathId, let moduleId):
            return "paths/\(pathId)/modules/\(moduleId)"
            
        case .getPlans:
            return "plans"
        case .getTransactionHistory, .createComment, .getComments:
            return ""
            
        case .getCourseProgress(let courseId):
            return "courses/\(courseId)"
            
        case .getAllCourseProgress:
            return "courses"
            
        case .getCourseProgressDetail(let courseId):
            return "courses/\(courseId)/detail"
            
        case .getLearningPathProgress(let learningPathId):
            return "learningPath/\(learningPathId)"
            
        case .getAllLearningPathProgress:
            return "learningPath"
            
        case .getModuleProgress(let learningPathId, let moduleId):
            return "learningPath/\(learningPathId)/module/\(moduleId)"
            
        case .getAllModuleProgress(let learningPathId):
            return "learningPath/\(learningPathId)/module"
            
        case .postTopicProgressEvent:
            return "events/user/topic"
            
        case .getDashboardData(let request):
            return "assembly/dashboard/\(request.rawValue).json"
            
        case .changePassword:
            return "change-password"
            
        case .updateComment(let commentId, _):
            return "\(commentId)"
            
        case .deleteComment(let commentId):
            return "\(commentId)"
            
        case .likeComment(let commentId), .unLikeComment(let commentId):
            return "\(commentId)/likes"
            
        case .search(let query):
            return "search?query=\(query)"
            
        case .allProgrammes:
            return "programmes"
            
        case .programme(let canonicalTitle):
            return "programmes/titles/\(canonicalTitle)"
            
        case .getPrimeList:
            return "prime"
            
        case .getPrime(let id):
            return "prime/\(id)"
            
        case .verifyPayment(let transactionId, _):
            return "apple/\(transactionId)/validate"
        }
    }
}
