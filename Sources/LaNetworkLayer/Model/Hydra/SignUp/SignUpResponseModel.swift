//
//  SignUpResponseModel.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 28/11/22.
//

import Foundation

public struct SignUpResponseModel: Codable {
    public let accessToken, refreshToken: String
    public let expiresIn: Int
}
