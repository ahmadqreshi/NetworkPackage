//
//  EmptyDataREsponse.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 04/11/22.
//

import Foundation
public struct ErrorDataResponse: Codable {
    public let code, path, message: String?
    public let errors: [ErrorType]?
}

// MARK: - Error
public struct ErrorType: Codable {
    public let field, message: String?
}
