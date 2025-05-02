//
//  FetchGroupsResponse.swift
//  CybozuUserAPI
//
//  Created by ky0me22 on 2025/05/02.
//

public struct FetchGroupsResponse: Decodable, Sendable, Equatable {
    public var groups: [CybozuGroup]
}
