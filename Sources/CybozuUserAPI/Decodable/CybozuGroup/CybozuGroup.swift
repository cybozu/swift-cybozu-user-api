//
//  Group.swift
//  CybozuUserAPI
//
//  Created by ky0me22 on 2025/05/02.
//

public struct CybozuGroup: Sendable, Equatable {
    public var id: Int
    public var code: String
    public var name: String
    public var description: String?
}

extension CybozuGroup: Decodable {
    enum CodingKeys: CodingKey {
        case id
        case code
        case name
        case description
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.customDecode(String.self, forKey: .id) { Int($0) }
        code = try container.decode(String.self, forKey: .code)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
    }
}
