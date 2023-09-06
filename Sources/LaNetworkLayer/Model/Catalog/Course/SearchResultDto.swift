//
//  File.swift
//  
//
//  Created by Ahmad Qureshi on 12/05/23.
//

import Foundation

public struct SearchResultDto: Codable{
    public let courses: [CourseDto]
    public let workshops: [CourseDto]
}
