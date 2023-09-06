import Foundation

class EngageWebService {
    
    private init() {}
    static let shared = EngageWebService()
    
    func createComment(
        createCommentDto: CreateCommentDto,
        success: @escaping SuccessCompletionBlock<CommentDto>,
        failure: @escaping ErrorFailureCompletionBlock
    ) {
        APIService.shared.requestNew(
            endpoint: .createComment(createCommentDto: createCommentDto),
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func getComments(
        courseId: String,
        lessonId: String,
        offset: String?,
        success: @escaping SuccessCompletionBlock<CommentListDto>,
        failure: @escaping ErrorFailureCompletionBlock
    ) {
        APIService.shared.requestNew(
            endpoint: .getComments(courseId: courseId, lessonId: lessonId, offset: offset),
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func updateComment(
        commentId: String,
        updateCommentDto: UpdateCommentDto,
        success: @escaping SuccessCompletionBlock<CommentDto>,
        failure: @escaping ErrorFailureCompletionBlock
    ) {
        APIService.shared.requestNew(
            endpoint: .updateComment(commentId: commentId, updateCommentDto: updateCommentDto),
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func deleteComment(
        commentId: String,
        success: @escaping SuccessCompletionBlock<EmptyDataResponse>,
        failure: @escaping ErrorFailureCompletionBlock
    ) {
        APIService.shared.requestNew(
            endpoint: .deleteComment(commentId: commentId),
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func likeComment(
        commentId: String,
        success: @escaping SuccessCompletionBlock<EmptyDataResponse>,
        failure: @escaping ErrorFailureCompletionBlock
    ) {
        APIService.shared.requestNew(
            endpoint: .likeComment(commentId: commentId),
            successHandler: success,
            failureHandler: failure
        )
    }
    
    func unLikeComment(
        commentId: String,
        success: @escaping SuccessCompletionBlock<EmptyDataResponse>,
        failure: @escaping ErrorFailureCompletionBlock
    ) {
        APIService.shared.requestNew(
            endpoint: .unLikeComment(commentId: commentId),
            successHandler: success,
            failureHandler: failure
        )
    }
    
}
