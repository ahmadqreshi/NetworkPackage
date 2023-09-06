import Foundation

class CatalogWebService {
    
    private init() {}
    static let shared = CatalogWebService()
    
    func fetchSubjectLists(success: @escaping SuccessCompletionBlock<SubjectListDto>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(
            endpoint: .fetchSubjectList,
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func getAllCourses(success: @escaping SuccessCompletionBlock<ReadCatalogDto>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(
            endpoint: .getAllCourses,
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func fetchCoursesListUsingSubjectId(courseType: CourseTypes, subjectId: String, success: @escaping SuccessCompletionBlock<ReadCatalogDto>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(
            endpoint: .fetchAllCoursesUsingSubjectId(courseType: courseType.rawValue, subjectId: subjectId),
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func fetchCourseByTitle(courseType: String, courseTitle: String, success: @escaping SuccessCompletionBlock<CourseDto>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(
            endpoint: .fetchCourseByTitle(courseType: courseType, courseTitle: courseTitle),
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func fetchCourseById(courseType: String, courseId: String, success: @escaping SuccessCompletionBlock<CourseDto>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(
            endpoint: .fetchCourseById(courseType: courseType, courseId: courseId),
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func getLearningPath(pathId: String, success: @escaping SuccessCompletionBlock<LearningPathDto>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(
            endpoint: .getLearningPath(pathId: pathId),
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func getLearningPathList(success: @escaping SuccessCompletionBlock<LearningPathListDto>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(
            endpoint: .getLearningPathList,
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func getLearningPathModuleList(pathId: String, success: @escaping SuccessCompletionBlock<LearningPathDto>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(
            endpoint: .getLearningPathModuleList(pathId: pathId),
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func getLearningPathModuleListWithCourse(pathId: String, moduleId: String, success: @escaping SuccessCompletionBlock<ModuleDto>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(
            endpoint: .getLearningPathModuleListWithCourse(pathId: pathId, moduleId: moduleId),
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func getDashboardData(dashboardRequest: DashboardRequest, success: @escaping SuccessCompletionBlock<DashboardDto>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(
            endpoint: .getDashboardData(dashboardRequest: dashboardRequest),
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func search(query: String, success: @escaping SuccessCompletionBlock<SearchResultDto>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(
            endpoint: .search(query: query),
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func getAllProgrammes(success: @escaping SuccessCompletionBlock<AllProgrammesDto>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(
            endpoint: .allProgrammes,
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func programme(canonicalTitle: String, success: @escaping SuccessCompletionBlock<ProgrammeDto>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(
            endpoint: .programme(canonicalTitle: canonicalTitle),
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func getAllPrimes(success: @escaping SuccessCompletionBlock<AllPrimeDto>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(
            endpoint: .getPrimeList,
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func getPrime(id: String, success: @escaping SuccessCompletionBlock<PrimeDto>, failure: @escaping ErrorFailureCompletionBlock) {
        APIService.shared.requestNew(
            endpoint: .getPrime(id: id),
            successHandler: success,
            failureHandler: failure
        )
    }
}
