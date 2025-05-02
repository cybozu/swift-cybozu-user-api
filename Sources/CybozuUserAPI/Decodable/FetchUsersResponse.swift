//
//  FetchUsersResponse.swift
//  CybozuUserAPI
//
//  Created by ky0me22 on 2025/04/10.
//

public struct FetchUsersResponse: Decodable, Sendable, Equatable {
    public var users: [User]
}
