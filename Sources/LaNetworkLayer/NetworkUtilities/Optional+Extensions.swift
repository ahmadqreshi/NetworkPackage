//
//  File.swift
//  
//
//  Created by Ahmad Qureshi on 28/02/23.
//
import Foundation

protocol AnyOptional {
    var isNil: Bool { get }
    var isNotNil: Bool { get }
}

extension Optional: AnyOptional {
    var isNil: Bool { self == nil }
    var isNotNil: Bool { self != nil }
}

extension Optional where Wrapped == String {
    var orEmpty: String {
        self ?? ""
    }
}
