//
//  UploadProfileImageResponse.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 06/12/22.
//

import Foundation
public struct UploadProfileImageResponse: Codable {
    public let size: Int
    public let url, fileName, oldFileName: String
}
