//
//  AuthenticationMethod.swift
//  CybozuUserAPI
//
//  Created by ky0me22 on 2025/04/10.
//

public enum AuthenticationMethod: Sendable {
    case cybozuAPIToken(String)
    case cybozuAuthorization(Credentials)
    case cybozuSession

    var headerField: String {
        switch self {
        case .cybozuAPIToken:
            "Authorization"
        case .cybozuAuthorization:
            "X-Cybozu-Authorization"
        case .cybozuSession:
            "X-Requested-With"
        }
    }

    var headerValue: String {
        switch self {
        case let .cybozuAPIToken(token):
            "Bearer \(token)"
        case let .cybozuAuthorization(credentials):
            credentials.base64EncodedValue
        case .cybozuSession:
            "URLRequest"
        }
    }
}
