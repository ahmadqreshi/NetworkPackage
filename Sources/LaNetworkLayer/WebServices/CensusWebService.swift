import Foundation

class CensusWebService {
    
    private init() {}
    static let shared = CensusWebService()
    
    func postTopicProgressEvent(
        courseProgressEventBatchDto: CourseProgressEventBatchDto,
        success: @escaping SuccessCompletionBlock<EmptyDataResponse>,
        failure: @escaping ErrorFailureCompletionBlock
    ) {
        APIService.shared.requestNew(
            endpoint: .postTopicProgressEvent(courseProgressEventBatchDto: courseProgressEventBatchDto),
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func getCourseProgress(
        courseId: String,
        success: @escaping SuccessCompletionBlock<CourseProgressResponseDto>,
        failure: @escaping ErrorFailureCompletionBlock
    ) {
        APIService.shared.requestNew(
            endpoint: .getCourseProgress(courseId: courseId),
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func getAllCourseProgress(
        success: @escaping SuccessCompletionBlock<CourseProgressListResponseDto>,
        failure: @escaping ErrorFailureCompletionBlock
    ) {
        APIService.shared.requestNew(
            endpoint: .getAllCourseProgress,
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func getCourseProgressDetail(
        courseId: String,
        success: @escaping SuccessCompletionBlock<CourseProgressDetailedResponseDto>,
        failure: @escaping ErrorFailureCompletionBlock
    ) {
        APIService.shared.requestNew(
            endpoint: .getCourseProgressDetail(courseId: courseId),
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func getLearningPathProgress(
        learningPathId: String,
        success: @escaping SuccessCompletionBlock<LearningPathProgressResponseDto>,
        failure: @escaping ErrorFailureCompletionBlock
    ) {
        APIService.shared.requestNew(
            endpoint: .getLearningPathProgress(learningPathId: learningPathId),
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func getAllLearningPathProgress(
        success: @escaping SuccessCompletionBlock<AllLearningPathProgressResponseDto>,
        failure: @escaping ErrorFailureCompletionBlock
    ) {
        APIService.shared.requestNew(
            endpoint: .getAllLearningPathProgress,
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func getModuleProgress(
        learningPathId: String,
        moduleId: String,
        success: @escaping SuccessCompletionBlock<ModuleProgressResponseDto>,
        failure: @escaping ErrorFailureCompletionBlock
    ) {
        APIService.shared.requestNew(
            endpoint: .getModuleProgress(learningPathId: learningPathId, moduleId: moduleId),
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func getAllModuleProgress(
        learningPathId: String,
        success: @escaping SuccessCompletionBlock<ModuleProgressListDto>,
        failure: @escaping ErrorFailureCompletionBlock
    ) {
        APIService.shared.requestNew(
            endpoint: .getAllModuleProgress(learningPathId: learningPathId),
            successHandler: success,
            failureHandler: failure
        )
    }
    
}
