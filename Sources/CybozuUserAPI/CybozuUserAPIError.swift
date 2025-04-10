//
//  CybozuUserAPIError.swift
//  CybozuUserAPI
//
//  Created by ky0me22 on 2025/04/10.
//

import Foundation

public enum CybozuUserAPIError: LocalizedError {
    case invalidResponse
    case requestFailed(ErrorDetail)

    public var errorDescription: String? {
        switch self {
        case .invalidResponse:
            "Received an invalid response."
        case let .requestFailed(errorDetail):
            "Failed to request. \(errorDetail)"
        }
    }
}
