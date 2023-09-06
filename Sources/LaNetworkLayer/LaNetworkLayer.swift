import UIKit

public struct LaNetworkLayer {
    
    public struct InternetUtility {
        public static func isConnectedToNetwork() -> Bool {
            return APIService.shared.isConnectedToNetwork()
        }
    }
    
    //MARK: - HYDRA API Calls
    public struct HydraWebServices {
        public static func login(email: String, password: String, captcha: String, success: @escaping SuccessCompletionBlock<LoginResponseModel>, failure: @escaping ErrorFailureCompletionBlock) {
            HydraWebService.shared.login(email: email, password: password, captcha: captcha, success: success, failure: failure)
        }
        public static func signUp(request: SignUpRequest, success: @escaping SuccessCompletionBlock<SignUpResponseModel>, failure: @escaping ErrorFailureCompletionBlock) {
            HydraWebService.shared.signUp(request: request, success: success, failure: failure)
        }
        public static func loginWithGoogle(token: String, couponCode: String?, success: @escaping SuccessCompletionBlock<LoginResponseModel>, failure: @escaping ErrorFailureCompletionBlock) {
            HydraWebService.shared.loginWithGoogle(token: token, couponCode: couponCode, success: success, failure: failure)
        }
        public static func loginWithApple(request: AppleSignInRequest, success: @escaping SuccessCompletionBlock<LoginResponseModel>, failure: @escaping ErrorFailureCompletionBlock) {
            HydraWebService.shared.loginWithApple(request: request, success: success, failure: failure)
        }
        public static func uploadUserProfile(profileImage: UIImage, success: @escaping SuccessCompletionBlock<UploadProfileImageResponse>, failure: @escaping ErrorFailureCompletionBlock) {
            HydraWebService.shared.uploadUserProfile(profileImage: profileImage, success: success, failure: failure)
        }
        public static func updateUserProfile(request: UpdateProfileRequest, success: @escaping SuccessCompletionBlock<ProfileModel>, failure: @escaping ErrorFailureCompletionBlock) {
            HydraWebService.shared.updateUserProfile(request: request, success: success, failure: failure)
        }
        public static func getUserProfile(success: @escaping SuccessCompletionBlock<ProfileModel>, failure: @escaping ErrorFailureCompletionBlock) {
            HydraWebService.shared.getUserProfile(success: success, failure: failure)
        }
        public static func sendEmail(email: String, captcha: String, success: @escaping SuccessCompletionBlock<EmptyDataResponse>, failure: @escaping ErrorFailureCompletionBlock) {
            HydraWebService.shared.sendEmail(email: email, captcha: captcha, success: success, failure: failure)
        }
        public static func resetPassword(request: ResetPasswordRequest, success: @escaping SuccessCompletionBlock<EmptyDataResponse>, failure: @escaping ErrorFailureCompletionBlock) {
            HydraWebService.shared.resetPassword(request: request, success: success, failure: failure)
        }
        public static func refreshToken(request: RefreshTokenRequest, success: @escaping SuccessCompletionBlock<RefreshTokenResponse>, failure: @escaping ErrorFailureCompletionBlock) {
            HydraWebService.shared.refreshToken(request: request, success: success, failure: failure)
        }
        public static func userLogout(success: @escaping SuccessCompletionBlock<EmptyDataResponse>, failure: @escaping ErrorFailureCompletionBlock) {
            HydraWebService.shared.userLogout(success: success, failure: failure)
        }
        public static func deleteAccount(success: @escaping SuccessCompletionBlock<EmptyDataResponse>, failure: @escaping ErrorFailureCompletionBlock) {
            HydraWebService.shared.deleteAccount(success: success, failure: failure)
        }
        public static func changePassword(request: ChangePasswordRequest, success: @escaping SuccessCompletionBlock<EmptyDataResponse>, failure: @escaping ErrorFailureCompletionBlock) {
            HydraWebService.shared.changePassword(request: request, success: success, failure: failure)
        }
    }
    
    //MARK: - CATALOG API calls
    public struct CatalogWebServices {
        public static func fetchSubjectLists(success: @escaping SuccessCompletionBlock<SubjectListDto>, failure: @escaping ErrorFailureCompletionBlock) {
            CatalogWebService.shared.fetchSubjectLists(success: success, failure: failure)
        }
        
        public static func getAllCourses(success: @escaping SuccessCompletionBlock<ReadCatalogDto>, failure: @escaping ErrorFailureCompletionBlock) {
            CatalogWebService.shared.getAllCourses(success: success, failure: failure)
        }
        
        public static func fetchCoursesListUsingSubjectId(courseType: CourseTypes, subjectId: String, success: @escaping SuccessCompletionBlock<ReadCatalogDto>, failure: @escaping ErrorFailureCompletionBlock) {
            CatalogWebService.shared.fetchCoursesListUsingSubjectId(courseType: courseType, subjectId: subjectId, success: success, failure: failure)
        }
        public static func fetchCourseByTitle(courseType: String, courseTitle: String, success: @escaping SuccessCompletionBlock<CourseDto>, failure: @escaping ErrorFailureCompletionBlock) {
            CatalogWebService.shared.fetchCourseByTitle(courseType: courseType, courseTitle: courseTitle, success: success, failure: failure)
        }
        
        public static func fetchCourseById(courseType: String, courseId: String, success: @escaping SuccessCompletionBlock<CourseDto>, failure: @escaping ErrorFailureCompletionBlock) {
            CatalogWebService.shared.fetchCourseById(courseType: courseType, courseId: courseId, success: success, failure: failure)
        }
        
        public static func getLearningPath(pathId: String, success: @escaping SuccessCompletionBlock<LearningPathDto>, failure: @escaping ErrorFailureCompletionBlock) {
            CatalogWebService.shared.getLearningPath(pathId: pathId, success: success, failure: failure)
        }
        
        public static  func getLearningPathList(success: @escaping SuccessCompletionBlock<LearningPathListDto>, failure: @escaping ErrorFailureCompletionBlock) {
            CatalogWebService.shared.getLearningPathList(success: success, failure: failure)
        }
        
        public static func getLearningPathModuleList(pathId: String, success: @escaping SuccessCompletionBlock<LearningPathDto>, failure: @escaping ErrorFailureCompletionBlock) {
            CatalogWebService.shared.getLearningPathModuleList(pathId: pathId, success: success, failure: failure)
        }
        
        public static func getLearningPathModuleListWithCourse(pathId: String, moduleId: String, success: @escaping SuccessCompletionBlock<ModuleDto>, failure: @escaping ErrorFailureCompletionBlock) {
            CatalogWebService.shared.getLearningPathModuleListWithCourse(pathId: pathId, moduleId: moduleId, success: success, failure: failure)
        }
        public static func getDashboardData(dashboardRequest: DashboardRequest, success: @escaping SuccessCompletionBlock<DashboardDto>, failure: @escaping ErrorFailureCompletionBlock) {
            CatalogWebService.shared.getDashboardData(dashboardRequest: dashboardRequest, success: success, failure: failure)
        }
        public static func search(query: String, success: @escaping SuccessCompletionBlock<SearchResultDto>, failure: @escaping ErrorFailureCompletionBlock) {
            CatalogWebService.shared.search(query: query, success: success, failure: failure)
        }
        public static func getAllProgrammes(success: @escaping SuccessCompletionBlock<AllProgrammesDto>, failure: @escaping ErrorFailureCompletionBlock) {
            CatalogWebService.shared.getAllProgrammes(success: success, failure: failure)
        }
        public static func programme(canonicalTitle: String, success: @escaping SuccessCompletionBlock<ProgrammeDto>, failure: @escaping ErrorFailureCompletionBlock) {
            CatalogWebService.shared.programme(canonicalTitle: canonicalTitle, success: success, failure: failure)
        }
        public static func getAllPrimes(success: @escaping SuccessCompletionBlock<AllPrimeDto>, failure: @escaping ErrorFailureCompletionBlock) {
            CatalogWebService.shared.getAllPrimes(success: success, failure: failure)
        }
        public static func getPrime(id: String, success: @escaping SuccessCompletionBlock<PrimeDto>, failure: @escaping ErrorFailureCompletionBlock) {
            CatalogWebService.shared.getPrime(id: id, success: success, failure: failure)
        }
    }
    
    //MARK: - MINT API calls
    public struct MintWebServices {
        
        public static func getPlans(success: @escaping SuccessCompletionBlock<PlanListDto>, failure: @escaping ErrorFailureCompletionBlock) {
            MintWebService.shared.getPlans(success: success, failure: failure)
        }
        
        public static func getPaymentHistory(success: @escaping SuccessCompletionBlock<PaymentHistoryListDto>, failure: @escaping ErrorFailureCompletionBlock) {
            MintWebService.shared.getPaymentHistory(success: success, failure: failure)
        }
        
        public static func verifyPayment(transactionId: String, receiptData: String, success: @escaping SuccessCompletionBlock<PaymentHistoryDto>, failure: @escaping ErrorFailureCompletionBlock) {
            MintWebService.shared.verifyPayment(transactionId: transactionId, receiptData: receiptData, success: success, failure: failure)
        }
    }
    
    //MARK: - CENSUS API calls
    public struct CensusWebServices {
        public static func postTopicProgressEvent(
            courseProgressEventBatchDto: CourseProgressEventBatchDto,
            success: @escaping SuccessCompletionBlock<EmptyDataResponse>,
            failure: @escaping ErrorFailureCompletionBlock
        ) {
            CensusWebService.shared.postTopicProgressEvent(courseProgressEventBatchDto: courseProgressEventBatchDto, success: success, failure: failure)
        }
        
        public static func getCourseProgress(
            courseId: String,
            success: @escaping SuccessCompletionBlock<CourseProgressResponseDto>,
            failure: @escaping ErrorFailureCompletionBlock
        ) {
            CensusWebService.shared.getCourseProgress(courseId: courseId, success: success, failure: failure)
        }
        
        public static func getAllCourseProgress(
            success: @escaping SuccessCompletionBlock<CourseProgressListResponseDto>,
            failure: @escaping ErrorFailureCompletionBlock
        ) {
            CensusWebService.shared.getAllCourseProgress(success: success, failure: failure)
        }
        
        public static func getCourseProgressDetail(
            courseId: String,
            success: @escaping SuccessCompletionBlock<CourseProgressDetailedResponseDto>,
            failure: @escaping ErrorFailureCompletionBlock
        ) {
            CensusWebService.shared.getCourseProgressDetail(courseId: courseId, success: success, failure: failure)
        }
        
        public static func getLearningPathProgress(
            learningPathId: String,
            success: @escaping SuccessCompletionBlock<LearningPathProgressResponseDto>,
            failure: @escaping ErrorFailureCompletionBlock
        ) {
            CensusWebService.shared.getLearningPathProgress(learningPathId: learningPathId, success: success, failure: failure)
        }
        
        public static func getAllLearningPathProgress(
            success: @escaping SuccessCompletionBlock<AllLearningPathProgressResponseDto>,
            failure: @escaping ErrorFailureCompletionBlock
        ) {
            CensusWebService.shared.getAllLearningPathProgress(success: success, failure: failure)
        }
        
        public static func getModuleProgress(
            learningPathId: String,
            moduleId: String,
            success: @escaping SuccessCompletionBlock<ModuleProgressResponseDto>,
            failure: @escaping ErrorFailureCompletionBlock
        ) {
            CensusWebService.shared.getModuleProgress(learningPathId: learningPathId, moduleId: moduleId, success: success, failure: failure)
        }
        
        public static func getAllModuleProgress(
            learningPathId: String,
            success: @escaping SuccessCompletionBlock<ModuleProgressListDto>,
            failure: @escaping ErrorFailureCompletionBlock
        ) {
            CensusWebService.shared.getAllModuleProgress(learningPathId: learningPathId, success: success, failure: failure)
        }
    }
    
    //MARK: - Engage API calls
    public struct EngageWebServices {
        public static func createComment(
            createCommentDto: CreateCommentDto,
            success: @escaping SuccessCompletionBlock<CommentDto>,
            failure: @escaping ErrorFailureCompletionBlock
        ) {
            EngageWebService.shared.createComment(createCommentDto: createCommentDto, success: success, failure: failure)
        }
        
        public static func getComments(
            courseId: String,
            lessonId: String,
            offset: String?,
            success: @escaping SuccessCompletionBlock<CommentListDto>,
            failure: @escaping ErrorFailureCompletionBlock
        ) {
            EngageWebService.shared.getComments(courseId: courseId, lessonId: lessonId, offset: offset, success: success, failure: failure)
        }
        
        public static func updateComment(
            commentId: String,
            updateCommentDto: UpdateCommentDto,
            success: @escaping SuccessCompletionBlock<CommentDto>,
            failure: @escaping ErrorFailureCompletionBlock
        ) {
            EngageWebService.shared.updateComment(commentId: commentId, updateCommentDto: updateCommentDto, success: success, failure: failure)
        }
        
        public static func deleteComment(
            commentId: String,
            success: @escaping SuccessCompletionBlock<EmptyDataResponse>,
            failure: @escaping ErrorFailureCompletionBlock
        ) {
            EngageWebService.shared.deleteComment(commentId: commentId, success: success, failure: failure)
        }
        
        public static func likeComment(
            commentId: String,
            success: @escaping SuccessCompletionBlock<EmptyDataResponse>,
            failure: @escaping ErrorFailureCompletionBlock
        ) {
            EngageWebService.shared.likeComment(commentId: commentId, success: success, failure: failure)
        }
        
        public static func unLikeComment(
            commentId: String,
            success: @escaping SuccessCompletionBlock<EmptyDataResponse>,
            failure: @escaping ErrorFailureCompletionBlock
        ) {
            EngageWebService.shared.unLikeComment(commentId: commentId, success: success, failure: failure)
        }
    }
}
