//
//  FetchOrganizationsResponse.swift
//  CybozuUserAPI
//
//  Created by ky0me22 on 2025/05/02.
//

public struct FetchOrganizationsResponse: Decodable, Sendable, Equatable {
    public var organizations: [Organization]
}
