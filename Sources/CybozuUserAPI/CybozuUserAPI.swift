//
//  CybozuUserAPI.swift
//  CybozuUserAPI
//
//  Created by ky0me22 on 2025/04/10.
//

import Foundation

public struct CybozuUserAPI: Sendable {
    var authenticationMethod: AuthenticationMethod
    var dataRequestHandler: @Sendable (URLRequest) async throws -> (Data, URLResponse)

    public init(
        authenticationMethod: AuthenticationMethod,
        dataRequestHandler: @escaping @Sendable (URLRequest) async throws -> (Data, URLResponse)
    ) {
        self.authenticationMethod = authenticationMethod
        self.dataRequestHandler = dataRequestHandler
    }

    private func makeRequest(
        httpMethod: HTTPMethod,
        endpoint: Endpoint,
        queryItems: [URLQueryItem]
    ) -> URLRequest {
        var url = URL(string: "\(endpoint.rawValue)")!
        if !queryItems.isEmpty {
            url.append(queryItems: queryItems)
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.addValue(
            authenticationMethod.headerValue,
            forHTTPHeaderField: authenticationMethod.headerField
        )
        return request
    }

    private func check(response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw CybozuUserAPIError.invalidResponse
        }
        guard httpResponse.statusCode == 200 else {
            throw CybozuUserAPIError.requestFailed(ErrorDetail(
                statusCode: httpResponse.statusCode,
                cybozuError: httpResponse.value(forHTTPHeaderField: "X-Cybozu-Error")
            ))
        }
    }

    public func fetchUsers(
        ids: [Int]? = nil,
        codes: [String]? = nil,
        size: Int? = nil,
        offset: Int? = nil
    ) async throws -> FetchUsersResponse {
        var queryItems = [URLQueryItem]()
        queryItems.appendQueryItems(name: "ids", values: ids?.compactMap(String.init))
        queryItems.appendQueryItems(name: "codes", values: codes)
        queryItems.appendQueryItem(name: "size", value: size?.description)
        queryItems.appendQueryItem(name: "offset", value: offset?.description)
        let request = makeRequest(httpMethod: .get, endpoint: .users, queryItems: queryItems)
        let (data, response) = try await dataRequestHandler(request)
        try check(response: response)
        return try JSONDecoder().decode(FetchUsersResponse.self, from: data)
    }

    public func fetchOrganizations(
        ids: [Int]? = nil,
        codes: [String]? = nil,
        size: Int? = nil,
        offset: Int? = nil
    ) async throws -> FetchOrganizationsResponse {
        var queryItems = [URLQueryItem]()
        queryItems.appendQueryItems(name: "ids", values: ids?.compactMap(String.init))
        queryItems.appendQueryItems(name: "codes", values: codes)
        queryItems.appendQueryItem(name: "size", value: size?.description)
        queryItems.appendQueryItem(name: "offset", value: offset?.description)
        let request = makeRequest(httpMethod: .get, endpoint: .organizations, queryItems: queryItems)
        let (data, response) = try await dataRequestHandler(request)
        try check(response: response)
        return try JSONDecoder().decode(FetchOrganizationsResponse.self, from: data)
    }
}
