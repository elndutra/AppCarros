//
//  NetWorkError.swift
//  CarrosSwifUI
//
//  Created by Elielton Dutra on 22/10/23.
//

import Foundation
enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Failed to decode the error from the service"
        case .errorCode(let code):
            return "\(code) - Something went wrong"
        case .unknown:
            return "The error is unknown"
        }
    }
}
