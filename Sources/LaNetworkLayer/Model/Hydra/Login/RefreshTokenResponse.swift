//
//  RefreshTokenResponse.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 09/01/23.
//

import Foundation
public struct RefreshTokenResponse: Codable {
    public let accessToken: String
    public let refreshToken: String
    public let tokenType: String
    public let expiresIn: Int
    public let profile: ProfileModel?
}
