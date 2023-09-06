//
//  ResponseStatus.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 04/11/22.
//

import Foundation
public struct ResponseStatus {
    public var code: String
    public var msg: String
    public var errorObject: DecodingError?
    public init(code: String = "", msg: String = "", errorObject: DecodingError? = nil) {
        self.code = code
        self.msg = msg
        if errorObject != nil {
            self.errorObject = errorObject
            debugPrint("Decoding Error : \(self.errorObject.debugDescription)")
        }
    }
}
